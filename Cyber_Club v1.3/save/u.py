i = 1
d = {}
def add_item(itemName, itemCost):
  global d
  if itemName in d:
    d[itemName][0] += 1
  else:
    d[itemName] = [1, itemCost]
  return d
 
def print_receipt():
  global i
  total = 0
  print('чек:', i, '; видов товара:', len(d), 'всего товаров:', end=' ')
  c = 0
  for j in d.values():
    c += j[0]
  print(c)
  for k, v in d.items():
 
    print(k + ' x' + str(v[0]), ':', v[0]*v[1])
    total += v[0]*v[1]
  print('итоговая стоимость:', total)
  print('-----')
  i+=1
 
 
itemdict = {}
 
while True:
  itemName = input('Выберите товар')
  if itemName in itemdict:
    print('Добавлена ещё одна единица товара', itemName)
    add_item(itemName, itemdict[itemName])
    continue
  if itemName == '':
    print()
    print_receipt()
    d = {}
    itemdict = {}
    total = 0
    continue
  if itemName == '#':
    break
  itemCost = float(input('Цена'))
  itemdict[itemName] = itemCost
  add_item(itemName, itemCost)