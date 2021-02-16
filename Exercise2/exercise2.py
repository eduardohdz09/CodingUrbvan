def problem2(a: list, b: list):
    
    aux_dict = {value: index for index, value in enumerate(b)}
    print(aux_dict)
    result = [aux_dict[x] for x in a]
    return result


if __name__ == "__main__":
    a = [50, 28, 46, 32, 50]
    b = [50, 50, 32, 46, 28]
    print(problem2(a,b))