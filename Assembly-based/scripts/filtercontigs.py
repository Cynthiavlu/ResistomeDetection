sequences = {}
filtered_reads = []
shorts_reads = []

with open("path-to-contigs.fasta", "r") as file:
        for line in file:
                line=line.rstrip()
                if (line[0] == ">"):
                        header = line
                        sequences[header] = ""
                else:
                        data = line
                        sequences[header] += data

# figure out which reads are good/bad
for header in sequences.keys():
        if (len(sequences[header]) > 499):
                filtered_reads.append(header)
        if (len(sequences[header]) < 500):
                shorts_reads.append(header)

# write good reads
with open("longcontigs.trimmed.fasta", "w+") as filtered_out:
        for header in filtered_reads:
                filtered_out.write("{}\n{}\n".format(header, sequences[header]))

# write bad reads
with open("shortcontigs.trimmed.fasta", "w+") as shorts_out:
        for header in shorts_reads:
                shorts_out.write("{}\n{}\n".format(header, sequences[header]))
