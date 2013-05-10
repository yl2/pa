import numpy as np
import glob as glob
import sys
from optparse import OptionParser

def runPA(filename, random, sectorNames, outfile):
    data = np.recfromtxt(filename, delimiter=',', names=True)
    names = data.dtype.names
    sectors = {}
    for name in sectorNames:
        sectors[name] = {}
    numRecord = len(data)
    count = 0
    portfolioWeights = {}
    benchmarkWeights = {}
    portfolioReturns = {}
    benchmarkReturns = {}
    interactionEffects = {}
    selectionEffects = {}
    styleAllocationEffects = {}
    sectorAllocationEffects = {}
    overallPortfolioReturns = 0
    overallBenchmarkReturns = 0
    sumPW = 0
    sumBW = 0
    while count < numRecord:
        record = data[count]
        count = count + 1
        sectorName = record[names.index('Sector')]
        styleName = sectorName + '.' + record[names.index('Style')]
        assetName = record[names.index('Asset')]
        if random == True: 
            assetReturns = (2*np.random.rand() - 1)/10
            if count == numRecord:
                assetPW = 1 - sumPW
                assetBW = 1 - sumBW
            else:
                assetPW = np.random.rand() / 15
                assetBW = np.random.rand() / 15
                sumPW += assetPW
                sumBW += assetBW
        else:
            assetReturns = record[names.index('Asset_Returns')]
            assetPW = record[names.index('Portfolio_Weight')]
            assetBW = record[names.index('Benchmark_Weight')]

        assetPReturns = assetPW * assetReturns
        assetBReturns = assetBW * assetReturns
        overallPortfolioReturns += assetPReturns
        overallBenchmarkReturns += assetBReturns
        sectorDict = sectors[sectorName]
        try:
            styleDict = sectorDict[styleName]
        except KeyError:
            styleDict = {}
            sectorDict[styleName] = styleDict
        styleDict[assetName] = assetReturns

        addToDict(portfolioWeights, styleName, assetPW)
        addToDict(portfolioWeights, sectorName, assetPW)
        addToDict(portfolioReturns, styleName, assetPReturns )
        addToDict(portfolioReturns, sectorName, assetPReturns)
        
        addToDict(benchmarkWeights, styleName, assetBW)
        addToDict(benchmarkWeights, sectorName, assetBW)
        addToDict(benchmarkReturns, styleName, assetBReturns)
        addToDict(benchmarkReturns, sectorName, assetBReturns)

        portfolioWeights[assetName] = assetPW
        benchmarkWeights[assetName] = assetBW
        portfolioReturns[assetName] = assetReturns
        benchmarkReturns[assetName] = assetReturns

    for sector, styleDict in sectors.iteritems():
        sectorPW = portfolioWeights.get(sector);
        sectorBW = benchmarkWeights.get(sector);
        sectorPR = portfolioReturns.get(sector);
        sectorBR = benchmarkReturns.get(sector);
        sectorIntact = 0
        sectorSelec = 0
        sectorStyleAlloc = 0
        sectorAlloc = (sectorPW - sectorBW) * (sectorBR/sectorBW - overallBenchmarkReturns)
        for style, styDict in styleDict.iteritems():
            stylePW = portfolioWeights.get(style);
            styleBW = benchmarkWeights.get(style);
            stylePR = portfolioReturns.get(style);
            styleBR = benchmarkReturns.get(style);
            styleIntact = 0
            styleSelec = 0
            styleAlloc = sectorPW * (stylePW/sectorPW - styleBW/sectorBW) * (styleBR/styleBW - sectorBR/sectorBW)
            styleAllocationEffects[style] = styleAlloc
            sectorStyleAlloc += styleAlloc
            for asset in styDict.keys():
                assetPW = portfolioWeights.get(asset);
                assetBW = benchmarkWeights.get(asset);
                assetPR = portfolioReturns.get(asset);
                assetBR = benchmarkReturns.get(asset);
                selec = styleBW * (assetPW/stylePW - assetBW/styleBW) * (assetPR - styleBR/styleBW)
                intact = (assetPW - assetBW) * (stylePR/stylePW - styleBR/styleBW)
                interactionEffects[asset] = selec
                selectionEffects[asset] = intact
                styleIntact += intact
                styleSelec += selec
            interactionEffects[style] = styleIntact
            selectionEffects[style] = styleSelec
            sectorIntact += styleIntact
            sectorSelec += styleSelec
        interactionEffects[sector] = sectorIntact
        selectionEffects[sector] = sectorSelec
        styleAllocationEffects[sector] = sectorStyleAlloc
        sectorAllocationEffects[sector] = sectorAlloc
    
    overallActiveReturns = overallPortfolioReturns - overallBenchmarkReturns
    checkSum(sectors, sectorAllocationEffects, styleAllocationEffects, selectionEffects, interactionEffects, overallActiveReturns, outfile)

    effectNames = ['sectorAllocationEffects', 'styleAllocationEffects', 'selectionEffects', 'interactionEffects']
    attr = np.zeros((len(sectorNames), 4))
    for sector in sectorNames:
        j = 0
        for data in (sectorAllocationEffects, styleAllocationEffects, selectionEffects, interactionEffects):
            attr[sectorNames.index(sector), j] = data[sector]
            j = j + 1

    outfile.write( 'overallPortfolioReturns' + ',' + str(overallPortfolioReturns) +'\n')
    outfile.write( 'overallBenchmarkReturns' + ',' + str(overallBenchmarkReturns) +'\n')

    return (effectNames, attr, overallPortfolioReturns, overallBenchmarkReturns)

def checkSum(sectors, sectorAllocationEffects, styleAllocationEffects, selectionEffects, interactionEffects, activeReturns, outfile):
    sumofEffects = 0
    for sector in sectors.keys():
        sumofEffects += sectorAllocationEffects[sector]
        sumofEffects += styleAllocationEffects[sector]
        sumofEffects += selectionEffects[sector]
        sumofEffects += interactionEffects[sector]

    if (abs(sumofEffects - activeReturns) < 0.0001):
        print True
    else:
        print False
    
    outfile.write( 'active returns,' + str(activeReturns) +'\n')
    outfile.write( 'sum of effects,' + str(sumofEffects) +'\n')

def addToDict(dictMap, name, value):
    try:
        preValue = dictMap[name]
        dictMap[name] = preValue + value
    except KeyError:
        dictMap[name] = value

def runmain(argv=None):
    if argv == None:
        argv = sys.argv

    usage = 'usage: %prog [options]\n'
    cmdlineParser = OptionParser(usage=usage)
    cmdlineParser.add_option("--dataFilePattern", dest="pattern", default='period*.csv',
         help='Name of the datafile containing returns data (default: %default)')
    cmdlineParser.add_option("--randomData", dest="random", default=False,
            help='Use randomly genrated data (default: %default)')

    (cmdoptions, args) = cmdlineParser.parse_args(argv)
    random = cmdoptions.random
    outfile = open('returnsPA.out', 'w') 
    files = glob.glob(cmdoptions.pattern)
    sectorNames = []
    cumPReturns = 1
    cumBReturns = 1
    for f in files:
        if len(sectorNames) == 0:
            data = np.recfromtxt(f, delimiter=',', names=True)
            names = data.dtype.names
            sectors = {}
            sectorNames = set(data['Sector'])
            sectorNames = list(sectorNames)
            linkedAttr = np.zeros((len(sectorNames), 4))
        outfile.write(f + '\n')
        (effectNames, attr, overallPortfolioReturns, overallBenchmarkReturns) = runPA(f, random, sectorNames, outfile)
        periodCoeff = (np.log(1 + overallPortfolioReturns) - np.log(1 + overallBenchmarkReturns))/(overallPortfolioReturns - overallBenchmarkReturns)
        linkedAttr += attr * periodCoeff
        cumPReturns = cumPReturns * (1 + overallPortfolioReturns)
        cumBReturns = cumBReturns * (1 + overallBenchmarkReturns)

    overallCoeff = (np.log(cumPReturns) - np.log(cumBReturns))/(cumPReturns - cumBReturns)

    linkedAttr = linkedAttr / overallCoeff
    
    header = 'Sector'
    for effect in effectNames:
        header = header + ',' + effect
    outfile.write( header +'\n')
    
    for sector in sectorNames:
        dataStr = sector
        index = sectorNames.index(sector)
        data = linkedAttr[sectorNames.index(sector)]
        count = 0
        while count < len(data):
            dataStr = dataStr + ',' + str(data[count])
            count = count + 1
        outfile.write( dataStr + '\n')

    cumActiveReturns = cumPReturns - cumBReturns
    linkedSumofEffects = linkedAttr.sum()
    if (abs(cumActiveReturns - linkedSumofEffects) < 0.0001):
        print True
    else:
        print False
    outfile.write( 'overall cumulative active returns,' + str(cumActiveReturns) +'\n')
    outfile.write( 'sum of linked effects,' + str(linkedSumofEffects) + '\n')
    outfile.close()

if __name__ == "__main__":
    runmain()
