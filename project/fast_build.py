s = open('template.txt').read()
res = []
for line in open('categories.txt').read().split('\n'):    
    words, remain = line.split(' : ')
    words = words.split()
    remain = remain.split()
    tu_loai = remain[0]
    cats = remain[1].split(',')    
    for x in remain[2:]:
        current = s
        arg = x.split(',')
        arg = ['arg'+str(i)+'~'+arg[i] for i in range(len(arg))]
        ARGs = ''
        for item in arg:
            ARGs = ARGs + '\n\t\t\t' + item + '..'            
        current = current.replace('tu_loai', tu_loai)
        current = current.replace('words', str(words))
        current = current.replace('CATs', cats[0])
        current = current.replace('ARGs', ARGs)
        print(current)
