
module TOOLS

using DataFrames, Dates, CSV, PrettyTables

day1="2023-09-05"
dayN="2024-06-30"
bloctimes=("8:00am","8:53am","8:56am","9:49am","9:52am","10:45am","11:11am","12:26pm","12:29pm","1:23pm","1:26pm","2:20pm")
holidays=Date.(["2023-09-19","2023-10-09","2023-11-07","2023-11-10","2023-11-23","2023-11-24","2023-12-23","2023-12-24","2023-12-25","2023-12-26","2023-12-27","2023-12-28","2023-12-29","2023-12-30","2023-12-31","2024-01-01","2024-01-15","2024-02-19","2024-02-20","2024-02-21","2024-02-22","2024-02-23","2024-04-15","2024-04-16","2024-04-17","2024-04-18","2024-04-19","2024-05-27","2024-06-19"])
halfdays=Date.(["2023-11-22","2023-12-22","2023-09-13","2023-10-18","2023-11-08","2023-11-15","2023-12-13","2024-01-17","2024-02-06","2024-03-13","2024-04-10","2024-05-15","2024-06-12","2024-02-14"])

"""
    table_school_days(fil=joinpath(tempname,".html"))


Use example:

```
using TheNumberLine, Dates

day1="2023-09-05"
dayN="2024-06-30"
bloctimes=( "8:00am","8:53am","8:56am","9:49am","9:52am","10:45am",
            "11:11am","12:26pm","12:29pm","1:23pm","1:26pm","2:20pm")
holidays=Date.(["2023-09-19","2023-10-09","2023-11-07","2023-11-10",
        "2023-11-23","2023-11-24","2023-12-23","2023-12-24","2023-12-25",
        "2023-12-26","2023-12-27","2023-12-28","2023-12-29","2023-12-30",
        "2023-12-31","2024-01-01","2024-01-15","2024-02-19","2024-02-20",
        "2024-02-21","2024-02-22","2024-02-23","2024-04-15","2024-04-16",
        "2024-04-17","2024-04-18","2024-04-19","2024-05-27","2024-06-19"])
halfdays=Date.(["2023-11-22","2023-12-22","2023-09-13","2023-10-18",
        "2023-11-08","2023-11-15","2023-12-13","2024-01-17","2024-02-06",
        "2024-03-13","2024-04-10","2024-05-15","2024-06-12","2024-02-14"])

table_school_days(file="my_school_days.html",
    day1=day1,dayN=dayN,bloctimes=bloctimes,
    holidays=holidays,halfdays=halfdays,offset=0)
```

or for csv output just change the file name extension : 

```
table_school_days(file="my_school_days.csv",
day1=day1,dayN=dayN,bloctimes=bloctimes,
holidays=holidays,halfdays=halfdays,offset=0)
```

"""
function table_school_days(;file=tempname()*".html",
    day1=day1,dayN=dayN,bloctimes=bloctimes,
    holidays=holidays,halfdays=halfdays,offset=0)

ndays=Date(dayN)-Date(day1)+Day(1)

ndays=ndays.value

rotationday=circshift(['A','B','C','D','E','F'],offset)
bloctimes=[Time(i,dateformat"II:MMp") for i in bloctimes]
starttime=circshift(bloctimes[1:2:end],offset)
endtime=circshift(bloctimes[2:2:end],offset)
rotationcolor=circshift([:red,:orange,:gold,:green,:blue,:violet],offset)

t_s(x)=Dates.format(starttime[mod1(x,6)],dateformat"II:MMp")
t_e(x)=Dates.format(endtime[mod1(x,6)],dateformat"II:MMp")

rotationtext=[t_s(t)*" to "*t_e(t) for t in 1:6]
#rotationcol(nam) = rotationcolor[findall(rotationtext.==nam)[1]]


alldays=[Date(day1)+Day(t-1) for t in 1:ndays]
ii=[(dayname(d)=="Sunday")|(dayname(d)=="Saturday")|sum(d.==holidays) for d in alldays]
jj=findall(ii.==1)
schooldays=setdiff(alldays,alldays[jj])

##

tab=DataFrame(date=String[],weekday=String[],rotationday=String[],
    A=String[],B=String[],C=String[],D=String[],E=String[],F=String[])

header=["date","week day","rotation day","A block class","B block class","C block class","D block class","E block class","F block class"]

for dd in 1:length(schooldays)
    d=schooldays[dd]
    r=6-mod1(dd,6)+1
    t=[t_s(t+r)*" to "*t_e(t+r) for t in 1:6]
    sum(d.==halfdays)==1 ? t=fill("half day",6) : nothing
#    push!(tab, (string(d)*"  ...",dayname(d),rotationday[r+1]*" day",t...))
    rd=mod1(dd,6)
    push!(tab, (string(d),", "*dayname(d),rotationday[rd]*" day",t...))
end

##

new_week_indices=findall(diff(schooldays).>Day(2)) .+1

hl_1 = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[1] && sum(new_week_indices.==i)==0, HtmlDecoration(color = string(rotationcolor[1])));
hl_2 = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[2] && sum(new_week_indices.==i)==0, HtmlDecoration(color = string(rotationcolor[2])));
hl_3 = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[3] && sum(new_week_indices.==i)==0, HtmlDecoration(color = string(rotationcolor[3])));
hl_4 = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[4] && sum(new_week_indices.==i)==0, HtmlDecoration(color = string(rotationcolor[4])));
hl_5 = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[5] && sum(new_week_indices.==i)==0, HtmlDecoration(color = string(rotationcolor[5])));
hl_6 = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[6] && sum(new_week_indices.==i)==0, HtmlDecoration(color = string(rotationcolor[6])));

hl_newweek = HtmlHighlighter((data, i, j) -> (j <=3) && sum(new_week_indices.==i)==1 , HtmlDecoration(background = "black",color= "white"))

hl_1b = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[1] && sum(new_week_indices.==i)==1, HtmlDecoration(background = "black",color = string(rotationcolor[1])));
hl_2b = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[2] && sum(new_week_indices.==i)==1, HtmlDecoration(background = "black",color = string(rotationcolor[2])));
hl_3b = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[3] && sum(new_week_indices.==i)==1, HtmlDecoration(background = "black",color = string(rotationcolor[3])));
hl_4b = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[4] && sum(new_week_indices.==i)==1, HtmlDecoration(background = "black",color = string(rotationcolor[4])));
hl_5b = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[5] && sum(new_week_indices.==i)==1, HtmlDecoration(background = "black",color = string(rotationcolor[5])));
hl_6b = HtmlHighlighter((data, i, j) -> (j >3) && data[i, j] == rotationtext[6] && sum(new_week_indices.==i)==1, HtmlDecoration(background = "black",color = string(rotationcolor[6])));
   
##

columncolor=[:red,:orange,:green,:blue,:indigo,:violet]
hl_nw = HtmlHighlighter((data, i, j) -> sum(new_week_indices.==i)==1 , HtmlDecoration(background = "black",color= "white"))
hl_A = HtmlHighlighter((data, i, j) -> (j ==3+1) && sum(new_week_indices.==i)==0, HtmlDecoration(background = "white",color= string(columncolor[1])));
hl_B = HtmlHighlighter((data, i, j) -> (j ==3+2) && sum(new_week_indices.==i)==0, HtmlDecoration(background = "white",color= string(columncolor[2])));
hl_C = HtmlHighlighter((data, i, j) -> (j ==3+3) && sum(new_week_indices.==i)==0, HtmlDecoration(background = "white",color= string(columncolor[3])));
hl_D = HtmlHighlighter((data, i, j) -> (j ==3+4) && sum(new_week_indices.==i)==0, HtmlDecoration(background = "white",color= string(columncolor[4])));
hl_E = HtmlHighlighter((data, i, j) -> (j ==3+5) && sum(new_week_indices.==i)==0, HtmlDecoration(background = "white",color= string(columncolor[5])));
hl_F = HtmlHighlighter((data, i, j) -> (j ==3+6) && sum(new_week_indices.==i)==0, HtmlDecoration(background = "white",color= string(columncolor[6])));

##

html_output(file,tab) = pretty_table(
        file,tab;
        backend = Val(:html),
        header=header,
        #body_hlines = new_week_indices,
        linebreaks = true,
        standalone = true,
#        highlighters = (hl_newweek, hl_1,hl_2,hl_3,hl_4,hl_5,hl_6,
#                        hl_1b,hl_2b,hl_3b,hl_4b,hl_5b,hl_6b),
        highlighters = (hl_A,hl_B,hl_C,hl_D,hl_E,hl_F,hl_nw),
        alignment=[:l, :l, :c, :c, :c, :c, :c, :c, :c]
    )

#show(tab)
#html_output(f,tab)

extension = try
    split(file,".")[2]
catch
    "unknown"
end

if extension=="html"
    open(file, "w") do f
        html_output(f,tab)
    end
elseif extension=="csv"
    CSV.write(file,tab)
else
    println("unknwown file extension")
end

return file

end

end

