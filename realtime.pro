;说明：这是一个获取计算机实际时间并转换为YYYYMMDDHHMMSS格式的程序
PRO Realtime
;获取现在的儒略历时间，换算为公历，将时间存入内存
caldat,systime(/JULIAN),month,day,year,hour,min,sec
;将年份去掉前后空格
year=strtrim(year,2)
;如果月份在1月到9月之间
if((month ge 1)and(month le 9))then begin
  month=strjoin(['0',strtrim(month,2)]);把月份前后的空格去掉，在前面加0
endif else begin
  month=strtrim(month,2);否则无需加0，只把月份前后的空格去掉即可
endelse
;如果日期在1日到9日之间
if((day ge 1)and(day le 9))then begin
  day=strjoin(['0',strtrim(day,2)]);把日期前后的空格去掉，在前面加0
endif else begin
  day=strtrim(day,2);否则无需加0，只把日期前后的空格去掉即可
endelse
;如果小时在0时到9时之间
if((hour ge 0)and(hour le 9))then begin
  hour=strjoin(['0',strtrim(hour,2)]);把小时前后的空格去掉，在前面加0
endif else begin
  hour=strtrim(hour,2);否则无需加0，只把小时前后的空格去掉即可
endelse
;如果分钟在0分到9分之间
if((min ge 0)and(min le 9))then begin
  min=strjoin(['0',strtrim(min,2)]);把分钟前后的空格去掉，在前面加0
endif else begin
  min=strtrim(min,2);否则无需加0，只把分钟前后的空格去掉即可
endelse
;如果秒钟在0秒到10秒之间（注意：秒钟是双精度浮点的小数）
if((sec ge 0)and(sec lt 10))then begin
  ;把秒钟转换为无符号整型，前后的空格去掉，在前面加0
  sec=strjoin(['0',strtrim(UINT(sec),2)])
endif else begin
  ;否则无需加0，只把秒钟转换为无符号整型，把秒钟前后的空格去掉即可
  sec=strtrim(UINT(sec),2)
endelse
;输出当前的时间
print,'现在的时间是北京时间'+year,month,day,hour,min,sec+':-D'
END