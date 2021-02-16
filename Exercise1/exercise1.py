def problem1(items: list):
        
    score_dict = {}
    for index, value in items:
        if index in score_dict.keys():
            aux_score = score_dict.get(index)
            score_dict[index] = aux_score + [value]
        else:
             score_dict[index] = [value]

    result = []
    
    for key in score_dict:
        result.append(get_average(key, score_dict.get(key)))

    return result


def get_average(key: int, scores: list):
    count = 0
    if len(scores) >= 5:
        scores.sort()
        scores.reverse()
        for x in range(0, 5):
            count = count + scores[x]
        return [key, int(count / 5)]
    else:
        return [key, -1]

if __name__ == "__main__":
    items = [[1,91], [1,92], [2,93], [2,97], [1,60], [2,77],[1,65],[1,87],[1,100],[2,100],[2,76], [3, 100],[1,30]]
    print(problem1(items))