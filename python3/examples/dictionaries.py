#Print a specific item from a dictionary
dict_1 = {
    "dict1": ["one", "two", "three"],
    "dict2": ["1", "2", "3"],
    "dict3": ["A", "B", "C"]
}

filt_key = ['dict2']

res = list(map(dict_1.get, filt_key))

######
dictionary = {
        "item_1"  : "ferrari",
        "facts"  : True,
        "list_1" : ["one", "two", "three"],
        "set_1"  : {"set1", "set2", "set3"}
        }
#Add a new item in a dictionary
dictionary["item_2"]="ford"
print(dictionary)

#Change an existing value of an item
dictionary["item_1"]="new_value"

#Print an element of a list within a dictionary
print(dictionary["list_1"][0:2])
