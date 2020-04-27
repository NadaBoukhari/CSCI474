fileIn = open("seq.txt")
source = input("Please input the source sequence: ")
print("\n")

pos =0
score =0
spaces=0
seqLen = len(source)
start=10
breakString = ''
maximum = -200000
i=0
match = " "
lineData = []
posID=0

for line in fileIn:
	for m in line[10:]:
		for pos in range(seqLen):
			if(start == len(line)):
				break
			if(source[pos] == line[start]):
				score = score + 5
			else:
				score = score - 3
			start+=1
		if(score>=maximum):
			maximum = score
			posID=i
			match = line
			spaces = start  - seqLen
		start= start - (seqLen -1 )
		score=0
	start=10
	i+=1

print("SOURCE: " +source+"\n", end="")
print("Highest Score: " + str(maximum)+ "\n", end ="")
print("Best Match Line: "+ match[:8]+"\n",end="")
print("\n")

x=' '
temp = spaces
spaces = spaces - 10
print(spaces*x + source)
print(spaces*x)
 
for s in range(seqLen):
	if(source[s] ==  match[temp]):
		breakString = breakString + "|"
	else:
		breakString = breakString + x
	temp+=1

print(spaces*x + breakString)
print(match[10:])
