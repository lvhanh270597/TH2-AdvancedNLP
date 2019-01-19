import re

s = '''1) anh Hùng sẽ là chú rể
2) chị Hoa sẽ là cô dâu
3) hai người nuôi một con chó
4) con chó của họ thường sủa mỗi sáng
5) anh Hùng thường nói chuyện với chị Hoa.
6) con chó này rất khôn.
7) nó là con chó huyền đề
8) chị Hoa dạy học sinh cấp hai
9) anh Hùng thông dịch tiếng Anh qua tiếng Việt
10) anh Hùng quen chị Hoa vì chị rất nữ tính.'''
words = set(['chú rể', 'cô dâu', 'huyền đề', 'học sinh', 'cấp hai', 'nữ tính', 'thông dịch'])
init = ['chú rể', 'cô dâu', 'huyền đề', 'học sinh', 'cấp hai', 'nữ tính', 'thông dịch']
for item in s.split('\n'):
    index = item.index(')')
    item = item[index + 2: ].lower()
    item = re.sub(r'[\,\.]', '', item)
    for w in init: item = item.replace(w, '')
    words = words.union(set(item.split()))
for word in words:
    print(word)