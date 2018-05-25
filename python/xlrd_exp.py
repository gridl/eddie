import xlrd
workbook = xlrd.open_workbook('data.xls')
worksheet = workbook.sheet_by_name('Sheet1')
num_rows = worksheet.nrows
num_cells = worksheet.ncols
curr_row = -1

with open("xxx.txt", "w") as fh:
    for row in range(num_rows):
        for column in range(num_cells):
            print worksheet.cell_value(row, column)
            fh.write("\n")
