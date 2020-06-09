import pandas as pd

#open the summary file
file = pd.read_csv('summary_abricate.csv', delimiter=';')
# print(file)                                                         #Is the file loaded correctly?

dict = {}

for (columnName, columnData) in file.iteritems():
   # print('Colunm Name : ', columnName)
   # print('Column Contents : ', columnData.values)
   line = columnName                                                #change names of first two columns
   if line == '#FILE':
       line = "#File"
   if line == 'NUM_FOUND':
       line = '#FoundGenes'

   if line != '#File' and line != '#FoundGenes':
        # line = columnName
        # print(line)                                               #are the lines printed?
        if line == "Campylobacter_coli_chloramphenicol_acetyltransferase":
            line = "Cat"
        if line == "Bifidobacterium_adolescentis_rpoB_conferring_resistance_to_rifampicin":
            line = "RpoB"
        if line == "Bifidobacteria_intrinsic_ileS_conferring_resistance_to_mupirocin":
            line = "IleS"
        if '(' in line[0]:
            line = line[5:]                                         #only give information after parenthesis
            # print(line)
        if '(' in line:
            line = line.replace("(", "").replace(")", "")           #remove the parenthesis
            # print(line)
        if '_' in line:
            line = line.split("_")[0]                               #remove underscore and everything behind it
        if "van" and "-" in line:
            line = line.replace('-',"")

        line = line.lower()
        line = line.capitalize()

        if len(line) >= 4:
            line = line[:-1] + line[-1].upper() + " "

        # print(line)                                               #are the lines printed?

   if line not in dict:
        dict[columnName] = line

# print(dict)

completelist = {}
for (columnName, columnData) in file.iteritems():
    if columnName in dict:
        rowCounter = 0
        rowDict = {}
        for columnValue in columnData:
            if columnValue != ".":
                rowDict[rowCounter] = columnValue
                if dict[columnName] in completelist:
                   # completelist[dict[columnName]] = rowDict
                    rowDict = completelist[dict[columnName]]
                    rowDict[rowCounter] = columnValue
                else:
                    completelist[dict[columnName]] = rowDict

            rowCounter += 1

print(completelist)


table = pd.DataFrame.from_dict(completelist)
sorted = table.sort_index(axis=1, ascending=True).sort_index(axis=0, ascending= True)

with open('CleanedAbricateSummary.csv', 'a') as f:
    f.write(sorted.to_csv(header=True, index=True, sep="\t"))
