def problem2(a: list, b: list):

    """ Function that receives two list and returns 
        the positions of the element in list A in list B
        Parameters:
        a: list
        b: list

        output: list with the positions of the element in list A in list B
    """
    
    aux_dict = {value: index for index, value in enumerate(b)}
    result = [aux_dict[x] for x in a]
    return result


if __name__ == "__main__":
    a = [50, 28, 46, 32, 50]
    b = [50, 50, 32, 46, 28]
    print(problem2(a,b))