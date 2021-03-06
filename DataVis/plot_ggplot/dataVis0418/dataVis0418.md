
## 분석 정보 시각표현하기 LAB01

### 정보 표현을 위한 그래픽 요소

시각화 도구를 이용하여 생성된 그래프나 차트는 인간의 눈을 통해 모양, 크기, 색, 위치
등의 패턴을 보게 되고 이를 뇌에서 해석한 뒤 학습

이 시지각 이론은 1900년대 초 독일의 심리학파인 게슈탈트
(Gestalt) 학파에 의해 활발하게 연구되었고, 시지각의 <b>게슈탈트 원리(The Gestalt
Principles of Visual Perception)</b>로 정립되었다.

### 게슈탈트 원리

<pre>
<font size=4 color="blue">
(1) 유사성의 법칙(Low of Similarity)
유사한 요소(형태, 색, 크기, 밝기)끼리 그룹 지어 하나의 패턴으로 보이게 함.

(2) 근접성의 법칙(Low of Proximity)
시공간적으로 서로 가까이 있는 것들을 함께 집단화하여 본다.

(3) 단순성의 법칙(Law of Simplicity)
주어진 조건으로 최대한 가장 단순한 쪽으로 인식한다.

(4) 연속성의 법칙(Law of Continuity)
요소들이 부드러운 연속을 따라 함께 묶여 지각된다.

(5) 폐쇄성의 법칙(Law of Closure)
기존의 지식을 토대로 완성되지 않은 형태를 완성해 간다.

</font>
</pre>

<img src="img/img01.png">

## (1) 유사성의 법칙(Low of Similarity)
## 유사한 요소(형태, 색, 크기, 밝기)끼리 그룹 지어 하나의 패턴으로 보이게 함.

<pre>
색이 가장 좋다.

[Usage]
scale_color_brewer(type = 'seq', palette = 1)

type :    색상에 사용되는 변수의 클래스입니다. 
          Sequential (seq) | Qualitative (qual) | Diverging (div)
palette : 사용할 색상 조합. 정수 또는 팔레트 이름이 될 수 있습니다.
          자세한 내용은 http://colorbrewer2.org/를 참조

다양한 scale_color_brewer
https://rstudio-pubs-static.s3.amazonaws.com/177286_826aed2f00794640b301aeb42533c6f1.html

</pre>


```R
# Make number of cylinders a factor, so ggplot will choose a discrete scale.
library(ggplot2)
mtcars$cyl<-factor(mtcars$cyl)

ggplot(mtcars, aes(wt, mpg)) + 
  geom_point(aes(color=cyl)) + 
  xlab("weight (1,000 lbs)") +
  scale_color_brewer("Cylinders", type="seq", palette=1)
```




![png](output_9_1.png)



```R

```

## (2) 근접성의 법칙(Low of Proximity)
## 시공간적으로 서로 가까이 있는 것들을 함께 집단화하여 본다.

### K-means 알고리즘에 의한 클러스터 분석을 수행해 보자.

### 군집분석(Cluster)
<pre>
(가) 군집분석은 비지도학습(Unsupervised learning) 분석 기법 중 하나.
(나) 사전 정보 없이 자료를 컴퓨터에게 주고 유사한 대상끼리 묶으라는 
     명령을 내리는 분석방법

K-means 군집 분석은? (거리를 이용)
01 분석자가 설정한 K개의 군집 중심점을 선정한다.
02 관측치가 거리상 가장 가까운 친구들을 군집화 시킨다.
...

</pre>

## 설명
<pre>
01 정규 분포를 따르는 난수 발생
02 주어진 데이터를 이용, 유사한 친구끼리 묶기
03 그래프로 시각화 해보기

matrix(rnorm(100, sd=0.3), ncol=2)   # 100개의 정규 분포 난수 발생(행렬 50,2로 만들기)

x : 데이터, centers = K개 그룹, iter.max : 반복 허용 횟수
kmeans(x,centers = 2, iter.max = 20)
</pre>


```R
x <- rbind(matrix(rnorm(100, sd=0.3), ncol=2),
          matrix(rnorm(100, mean=1, sd=0.3), ncol=2))
cl <- kmeans(x,centers = 2, iter.max = 20)
plot(x, col=cl$cluster)
points(cl$centers, col=1:2, pch=8)
cl$cluster
cl$centers
names(cl)
```


<ol class=list-inline>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>1</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
	<li>2</li>
</ol>




<table>
<tbody>
	<tr><th scope=row>1</th><td>0.0754458  </td><td>0.009646896</td></tr>
	<tr><th scope=row>2</th><td>0.9657752  </td><td>0.963409268</td></tr>
</tbody>
</table>




<ol class=list-inline>
	<li>'cluster'</li>
	<li>'centers'</li>
	<li>'totss'</li>
	<li>'withinss'</li>
	<li>'tot.withinss'</li>
	<li>'betweenss'</li>
	<li>'size'</li>
	<li>'iter'</li>
	<li>'ifault'</li>
</ol>




![png](output_15_3.png)


## 자크 베르탱(Jacques Bertin)의 그래픽 7요소

데이터나 정보들을 점, 선, 면, 영역, 입체 등의 <b>기하학 요소인 시각기호</b>로 그리고
이 시각기호를 색, 크기, 위치 등으로 장식하여, 양적, 질적 데이터의 비교,
관련성, 순서성 등을 인지할 수 있게 하는 시각적 표현 방법을 말함.

<pre>
그래픽 7요소는 시각변수 7가지
크기(size), 
모양(shape), 
밝기(lightness/value), 
색(color), 
방향(orientation), 
질감(texture), 
위치(location)를 말한다.
</pre>

### (1) 크기(size)

기하적 요소들이 같은 크기를 가진 경우 상대적으로 하나만 작
게 표시하면 작게 표현한 것만이 눈에 띄게 , 그리고 또 클수록 시선이 주목된다.

### (2) 모양(shape)

<pre>
같은 모양 중 하나만 다른 모양이 있는 경우 다른 모양이 강조되어 눈에 띈다.
</pre>

### (3) 색(color)

<pre>
같은 색을 이용한 것 중에서 다른 색을 사용한 요소가 더 잘 보인다. 
</pre>

### (4) 밝기(명도 lightness/value)

<pre>
동일한 색에 대하여 동일한 수준의 밝기(명도)를 가진 요소 중 일부만 다른 밝기를 줄때 눈에 띄게 된다. 밝기의 높고 낮음은 색보다 오히려 명시성에 영향을 주다.
</pre>

### (5) 방향(orientation)

<pre>
하나만 다른 방향으로 기울이면 방향이 다른 요소에 시선이 끌리게 된다.
</pre>

### (6) 질감(texture)

<pre>
같은 색상과 모양이라도 질감을 다르게 준 것만 강조된다.
</pre>

### (7) 위치(location)

<pre>
위치를 다르게 함으로써 강조할 수 있다. 특정한 요소의 상대적인 위치를 확인하여
주변의 다른 요소와의 관계를 비교한다.
</pre>

<pre>
그래픽 7요소는 시각변수 7가지
크기(size), 
모양(shape), 
밝기(lightness/value), 
색(color), 
방향(orientation), 
질감(texture), 
위치(location)를 말한다.
</pre>


```R
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()
```




![png](output_34_1.png)



```R
# 색(color), 

p + geom_point(aes(colour = factor(cyl)))
```




![png](output_35_1.png)



```R
# 모양(shape), 
p + geom_point(aes(shape = factor(cyl)))
```




![png](output_36_1.png)



```R
# 크기(size),

p + geom_point(aes(size = qsec))
```




![png](output_37_1.png)



```R
#방향(orientation), 
# coord_flip() : 수직이 수평, 수평이 수직이 되도록 좌표를 변경한다.

library(ggplot2)
# Basic box plot
bp <- ggplot(PlantGrowth, aes(x=group, y=weight))+
  geom_boxplot()
bp
# Horizontal box plot
bp + coord_flip()
```






![png](output_38_2.png)



![png](output_38_3.png)


<pre>
2 차원 커널 밀도 추정
지정된 범위에 걸쳐 커널 밀도 추정을 계산하고 래스터를 출력합니다.
</pre>


```R
df <- data.frame(x=rnorm(100),y=rnorm(100))
k <- MASS:::kde2d(df$x,df$y)
k
str(k)
```


<dl>
	<dt>$x</dt>
		<dd><ol class=list-inline>
	<li>-1.8787820099849</li>
	<li>-1.69023447874199</li>
	<li>-1.50168694749908</li>
	<li>-1.31313941625617</li>
	<li>-1.12459188501326</li>
	<li>-0.936044353770353</li>
	<li>-0.747496822527443</li>
	<li>-0.558949291284534</li>
	<li>-0.370401760041624</li>
	<li>-0.181854228798714</li>
	<li>0.00669330244419619</li>
	<li>0.195240833687106</li>
	<li>0.383788364930016</li>
	<li>0.572335896172926</li>
	<li>0.760883427415836</li>
	<li>0.949430958658746</li>
	<li>1.13797848990166</li>
	<li>1.32652602114457</li>
	<li>1.51507355238748</li>
	<li>1.70362108363039</li>
	<li>1.8921686148733</li>
	<li>2.08071614611621</li>
	<li>2.26926367735912</li>
	<li>2.45781120860203</li>
	<li>2.64635873984494</li>
</ol>
</dd>
	<dt>$y</dt>
		<dd><ol class=list-inline>
	<li>-2.23859607752579</li>
	<li>-2.03632387029289</li>
	<li>-1.83405166305998</li>
	<li>-1.63177945582708</li>
	<li>-1.42950724859417</li>
	<li>-1.22723504136127</li>
	<li>-1.02496283412836</li>
	<li>-0.822690626895456</li>
	<li>-0.62041841966255</li>
	<li>-0.418146212429645</li>
	<li>-0.21587400519674</li>
	<li>-0.013601797963835</li>
	<li>0.18867040926907</li>
	<li>0.390942616501976</li>
	<li>0.59321482373488</li>
	<li>0.795487030967786</li>
	<li>0.997759238200691</li>
	<li>1.2000314454336</li>
	<li>1.4023036526665</li>
	<li>1.60457585989941</li>
	<li>1.80684806713231</li>
	<li>2.00912027436522</li>
	<li>2.21139248159812</li>
	<li>2.41366468883103</li>
	<li>2.61593689606393</li>
</ol>
</dd>
	<dt>$z</dt>
		<dd><table>
<tbody>
	<tr><td>4.190153e-03</td><td>4.870558e-03</td><td>0.0049344534</td><td>0.0051438400</td><td>0.006546127 </td><td>0.009703355 </td><td>0.014119120 </td><td>0.01828125  </td><td>0.02072152  </td><td>0.02127577  </td><td>...         </td><td>0.0242262880</td><td>0.0240004966</td><td>1.997508e-02</td><td>1.343644e-02</td><td>7.183046e-03</td><td>3.040385e-03</td><td>1.034466e-03</td><td>3.031421e-04</td><td>9.184092e-05</td><td>3.432582e-05</td></tr>
	<tr><td>6.902591e-03</td><td>8.233439e-03</td><td>0.0087525970</td><td>0.0096026358</td><td>0.012175072 </td><td>0.016977520 </td><td>0.023056081 </td><td>0.02839995  </td><td>0.03152064  </td><td>0.03278815  </td><td>...         </td><td>0.0352890376</td><td>0.0335323660</td><td>2.728807e-02</td><td>1.821109e-02</td><td>9.785915e-03</td><td>4.247343e-03</td><td>1.558531e-03</td><td>5.583284e-04</td><td>2.384983e-04</td><td>1.177712e-04</td></tr>
	<tr><td>9.394385e-03</td><td>1.163271e-02</td><td>0.0132187642</td><td>0.0155833522</td><td>0.020154831 </td><td>0.026995118 </td><td>0.034465199 </td><td>0.04023140  </td><td>0.04334301  </td><td>0.04523174  </td><td>...         </td><td>0.0482809370</td><td>0.0445449477</td><td>3.574149e-02</td><td>2.386995e-02</td><td>1.306167e-02</td><td>5.968450e-03</td><td>2.499049e-03</td><td>1.158536e-03</td><td>6.451795e-04</td><td>3.639960e-04</td></tr>
	<tr><td>1.079000e-02</td><td>1.404602e-02</td><td>0.0173255260</td><td>0.0221553109</td><td>0.029610658 </td><td>0.038955602 </td><td>0.047714247 </td><td>0.05335898  </td><td>0.05581546  </td><td>0.05787018  </td><td>...         </td><td>0.0628051717</td><td>0.0571702433</td><td>4.573278e-02</td><td>3.088345e-02</td><td>1.745943e-02</td><td>8.617398e-03</td><td>4.245523e-03</td><td>2.455452e-03</td><td>1.588598e-03</td><td>9.521470e-04</td></tr>
	<tr><td>1.096841e-02</td><td>1.508414e-02</td><td>0.0202184525</td><td>0.0278226004</td><td>0.038429243 </td><td>0.050507836 </td><td>0.060859186 </td><td>0.06675985  </td><td>0.06876985  </td><td>0.07068470  </td><td>...         </td><td>0.0776180296</td><td>0.0705227368</td><td>5.670227e-02</td><td>3.902347e-02</td><td>2.303795e-02</td><td>1.244051e-02</td><td>7.128828e-03</td><td>4.783390e-03</td><td>3.348614e-03</td><td>2.078770e-03</td></tr>
	<tr><td>1.075156e-02</td><td>1.528088e-02</td><td>0.0216375451</td><td>0.0311673209</td><td>0.044041320 </td><td>0.058414639 </td><td>0.070847293 </td><td>0.07838497  </td><td>0.08141473  </td><td>0.08364757  </td><td>...         </td><td>0.0900063214</td><td>0.0818524497</td><td>6.634673e-02</td><td>4.675391e-02</td><td>2.900417e-02</td><td>1.712110e-02</td><td>1.104184e-02</td><td>8.115283e-03</td><td>5.953297e-03</td><td>3.817369e-03</td></tr>
	<tr><td>1.108604e-02</td><td>1.541902e-02</td><td>0.0217841142</td><td>0.0315666625</td><td>0.045023729 </td><td>0.060700462 </td><td>0.075574658 </td><td>0.08649399  </td><td>0.09270571  </td><td>0.09643071  </td><td>...         </td><td>0.0965086935</td><td>0.0874143979</td><td>7.141337e-02</td><td>5.171766e-02</td><td>3.383843e-02</td><td>2.165253e-02</td><td>1.520700e-02</td><td>1.183268e-02</td><td>9.011862e-03</td><td>6.030273e-03</td></tr>
	<tr><td>1.201387e-02</td><td>1.562165e-02</td><td>0.0209054220</td><td>0.0295281772</td><td>0.042262641 </td><td>0.058520342 </td><td>0.076094480 </td><td>0.09165131  </td><td>0.10265687  </td><td>0.10890155  </td><td>...         </td><td>0.0953043476</td><td>0.0851512056</td><td>6.999383e-02</td><td>5.226370e-02</td><td>3.612581e-02</td><td>2.479539e-02</td><td>1.852442e-02</td><td>1.503590e-02</td><td>1.194075e-02</td><td>8.478777e-03</td></tr>
	<tr><td>1.257350e-02</td><td>1.527587e-02</td><td>0.0192119733</td><td>0.0264873843</td><td>0.038542588 </td><td>0.055613749 </td><td>0.076150813 </td><td>0.09651521  </td><td>0.11234135  </td><td>0.12103995  </td><td>...         </td><td>0.0883192291</td><td>0.0769726248</td><td>6.343830e-02</td><td>4.884530e-02</td><td>3.558092e-02</td><td>2.595270e-02</td><td>2.040881e-02</td><td>1.726943e-02</td><td>1.443138e-02</td><td>1.098971e-02</td></tr>
	<tr><td>1.177725e-02</td><td>1.386765e-02</td><td>0.0171786578</td><td>0.0241957315</td><td>0.036793561 </td><td>0.055530817 </td><td>0.078956410 </td><td>0.10297873  </td><td>0.12193466  </td><td>0.13177250  </td><td>...         </td><td>0.0805006280</td><td>0.0680406036</td><td>5.586755e-02</td><td>4.396547e-02</td><td>3.338434e-02</td><td>2.567955e-02</td><td>2.126888e-02</td><td>1.884478e-02</td><td>1.655676e-02</td><td>1.337112e-02</td></tr>
	<tr><td>9.610826e-03</td><td>1.171795e-02</td><td>0.0156382446</td><td>0.0239252738</td><td>0.038348557 </td><td>0.059131232 </td><td>0.084434723 </td><td>0.10984253  </td><td>0.12931993  </td><td>0.13854610  </td><td>...         </td><td>0.0762982179</td><td>0.0630942851</td><td>5.126037e-02</td><td>4.041271e-02</td><td>3.130189e-02</td><td>2.514756e-02</td><td>2.197329e-02</td><td>2.029882e-02</td><td>1.835877e-02</td><td>1.519480e-02</td></tr>
	<tr><td>7.008270e-03</td><td>9.757658e-03</td><td>0.0152864866</td><td>0.0257948795</td><td>0.042347395 </td><td>0.064369307 </td><td>0.089597184 </td><td>0.11382009  </td><td>0.13160200  </td><td>0.13921077  </td><td>...         </td><td>0.0765643258</td><td>0.0630764187</td><td>5.061712e-02</td><td>3.922781e-02</td><td>3.026742e-02</td><td>2.501934e-02</td><td>2.286727e-02</td><td>2.167015e-02</td><td>1.956770e-02</td><td>1.594880e-02</td></tr>
	<tr><td>4.960111e-03</td><td>8.648264e-03</td><td>0.0160238922</td><td>0.0286032740</td><td>0.046395090 </td><td>0.068008100 </td><td>0.091198295 </td><td>0.11264093  </td><td>0.12806948  </td><td>0.13451052  </td><td>...         </td><td>0.0788903442</td><td>0.0653540120</td><td>5.197409e-02</td><td>3.943251e-02</td><td>2.992367e-02</td><td>2.500225e-02</td><td>2.349828e-02</td><td>2.249093e-02</td><td>1.989413e-02</td><td>1.554791e-02</td></tr>
	<tr><td>3.798840e-03</td><td>8.272168e-03</td><td>0.0169201411</td><td>0.0304727891</td><td>0.047975321 </td><td>0.067664845 </td><td>0.087947680 </td><td>0.10677150  </td><td>0.12093651  </td><td>0.12777852  </td><td>...         </td><td>0.0805129086</td><td>0.0668540569</td><td>5.291449e-02</td><td>3.958463e-02</td><td>2.947974e-02</td><td>2.447034e-02</td><td>2.324117e-02</td><td>2.235924e-02</td><td>1.942013e-02</td><td>1.452150e-02</td></tr>
	<tr><td>3.258272e-03</td><td>8.051693e-03</td><td>0.0169654447</td><td>0.0300820288</td><td>0.045954531 </td><td>0.063092044 </td><td>0.080935099 </td><td>0.09850570  </td><td>0.11305108  </td><td>0.12165641  </td><td>...         </td><td>0.0800301800</td><td>0.0661211508</td><td>5.226726e-02</td><td>3.891424e-02</td><td>2.848427e-02</td><td>2.313633e-02</td><td>2.190722e-02</td><td>2.129195e-02</td><td>1.851905e-02</td><td>1.356330e-02</td></tr>
	<tr><td>2.941771e-03</td><td>7.552437e-03</td><td>0.0158227872</td><td>0.0274782836</td><td>0.041156291 </td><td>0.056093815 </td><td>0.072620564 </td><td>0.09011691  </td><td>0.10559387  </td><td>0.11576588  </td><td>...         </td><td>0.0764367508</td><td>0.0624693021</td><td>4.939375e-02</td><td>3.683054e-02</td><td>2.657883e-02</td><td>2.097212e-02</td><td>1.968856e-02</td><td>1.953367e-02</td><td>1.743147e-02</td><td>1.293178e-02</td></tr>
	<tr><td>2.608758e-03</td><td>6.682092e-03</td><td>0.0137934956</td><td>0.0236297936</td><td>0.035331912 </td><td>0.048932171 </td><td>0.065076461 </td><td>0.08265247  </td><td>0.09804225  </td><td>0.10794846  </td><td>...         </td><td>0.0682455924</td><td>0.0549207884</td><td>4.335786e-02</td><td>3.243722e-02</td><td>2.319927e-02</td><td>1.789512e-02</td><td>1.677898e-02</td><td>1.718991e-02</td><td>1.598515e-02</td><td>1.226809e-02</td></tr>
	<tr><td>2.172375e-03</td><td>5.506882e-03</td><td>0.0112675926</td><td>0.0193450972</td><td>0.029550653 </td><td>0.042496411 </td><td>0.058555087 </td><td>0.07560611  </td><td>0.08937646  </td><td>0.09694208  </td><td>...         </td><td>0.0549511804</td><td>0.0433067016</td><td>3.396071e-02</td><td>2.545287e-02</td><td>1.816211e-02</td><td>1.393361e-02</td><td>1.328684e-02</td><td>1.417850e-02</td><td>1.376667e-02</td><td>1.095116e-02</td></tr>
	<tr><td>1.636693e-03</td><td>4.130008e-03</td><td>0.0084879079</td><td>0.0149058038</td><td>0.023814008 </td><td>0.036136889 </td><td>0.051738388 </td><td>0.06756434  </td><td>0.07893388  </td><td>0.08333734  </td><td>...         </td><td>0.0387297625</td><td>0.0296605466</td><td>2.293229e-02</td><td>1.716365e-02</td><td>1.229964e-02</td><td>9.579961e-03</td><td>9.481503e-03</td><td>1.057374e-02</td><td>1.064632e-02</td><td>8.706765e-03</td></tr>
	<tr><td>1.078083e-03</td><td>2.735214e-03</td><td>0.0057381138</td><td>0.0105366834</td><td>0.017984538 </td><td>0.029132829 </td><td>0.043502159 </td><td>0.05764257  </td><td>0.06683892  </td><td>0.06875499  </td><td>...         </td><td>0.0234988332</td><td>0.0173001814</td><td>1.306378e-02</td><td>9.722861e-03</td><td>7.036282e-03</td><td>5.667649e-03</td><td>5.911836e-03</td><td>6.878336e-03</td><td>7.116435e-03</td><td>5.928342e-03</td></tr>
	<tr><td>6.050100e-04</td><td>1.561685e-03</td><td>0.0034085887</td><td>0.0067068542</td><td>0.012481618 </td><td>0.021809081 </td><td>0.034204297 </td><td>0.04645438  </td><td>0.05416134  </td><td>0.05491970  </td><td>...         </td><td>0.0122519143</td><td>0.0085314468</td><td>6.213591e-03</td><td>4.572285e-03</td><td>3.355530e-03</td><td>2.835411e-03</td><td>3.142190e-03</td><td>3.796478e-03</td><td>4.004682e-03</td><td>3.374785e-03</td></tr>
	<tr><td>2.852037e-04</td><td>7.609423e-04</td><td>0.0017728571</td><td>0.0038498511</td><td>0.007972667 </td><td>0.015178724 </td><td>0.025234672 </td><td>0.03559241  </td><td>0.04241734  </td><td>0.04315966  </td><td>...         </td><td>0.0056039567</td><td>0.0035807781</td><td>2.464336e-03</td><td>1.776376e-03</td><td>1.325108e-03</td><td>1.186310e-03</td><td>1.399245e-03</td><td>1.745691e-03</td><td>1.866721e-03</td><td>1.584282e-03</td></tr>
	<tr><td>1.127412e-04</td><td>3.188113e-04</td><td>0.0008227023</td><td>0.0020392939</td><td>0.004778425 </td><td>0.009981905 </td><td>0.017738265 </td><td>0.02631130  </td><td>0.03257836  </td><td>0.03394234  </td><td>...         </td><td>0.0024212154</td><td>0.0013274645</td><td>8.246566e-04</td><td>5.706799e-04</td><td>4.321121e-04</td><td>4.121785e-04</td><td>5.161756e-04</td><td>6.613072e-04</td><td>7.140620e-04</td><td>6.086901e-04</td></tr>
	<tr><td>3.787490e-05</td><td>1.183425e-04</td><td>0.0003548382</td><td>0.0010317720</td><td>0.002747021 </td><td>0.006291271 </td><td>0.011990919 </td><td>0.01885799  </td><td>0.02456038  </td><td>0.02666319  </td><td>...         </td><td>0.0011695907</td><td>0.0004908090</td><td>2.452849e-04</td><td>1.535222e-04</td><td>1.164122e-04</td><td>1.183804e-04</td><td>1.566162e-04</td><td>2.050529e-04</td><td>2.229802e-04</td><td>1.906077e-04</td></tr>
	<tr><td>1.121164e-05</td><td>4.112733e-05</td><td>0.0001493054</td><td>0.0005102243</td><td>0.001521980 </td><td>0.003782979 </td><td>0.007707606 </td><td>0.01287225  </td><td>0.01772764  </td><td>0.02023852  </td><td>...         </td><td>0.0007264937</td><td>0.0002266924</td><td>7.679477e-05</td><td>3.658899e-05</td><td>2.612356e-05</td><td>2.802904e-05</td><td>3.891047e-05</td><td>5.184862e-05</td><td>5.667842e-05</td><td>4.853906e-05</td></tr>
</tbody>
</table>
</dd>
</dl>



    List of 3
     $ x: num [1:25] -1.88 -1.69 -1.5 -1.31 -1.12 ...
     $ y: num [1:25] -2.24 -2.04 -1.83 -1.63 -1.43 ...
     $ z: num [1:25, 1:25] 0.00419 0.0069 0.00939 0.01079 0.01097 ...
    

## 레벨 (등고선) 플롯 : filled.contour
<pre>
이 함수는 등고선 사이의 영역이 단색으로 채워진 등고선 플롯을 생성합니다

filled.contour(x = seq(0, 1, length.out = nrow(z)),
               y = seq(0, 1, length.out = ncol(z)),
               z,
               xlim = range(x, finite = TRUE),
               ylim = range(y, finite = TRUE),
               zlim = range(z, finite = TRUE),
               levels = pretty(zlim, nlevels), nlevels = 20,
               color.palette = cm.colors,
               col = color.palette(length(levels) - 1),
               plot.title, plot.axes, key.title, key.axes,
               asp = NA, xaxs = "i", yaxs = "i", las = 1,
               axes = TRUE, frame.plot = axes, …)
.filled.contour(x, y, z, levels, col)

</pre>


```R
filled.contour(k)
```


![png](output_42_0.png)



```R
#밝기(lightness/value)
df <- data.frame(x=rnorm(10000),y=rnorm(10000))
k <- MASS:::kde2d(df$x,df$y)

filled.contour(k)

library(ggplot2)
ggplot(df,aes(x=x,y=y))+geom_density2d()

ggplot(df,aes(x=x,y=y))+
  stat_density2d(aes(alpha=..level..), geom="polygon") +
  scale_alpha_continuous(limits=c(0,0.2),breaks=seq(0,0.2,by=0.025))+
  geom_point(colour="red",alpha=0.02)+
  theme_bw()
```




![png](output_43_1.png)





![png](output_43_3.png)



![png](output_43_4.png)



```R

```

## 그래픽 품질 향상을 위한 그래픽 디자인 원리

### 1. 타이포그래피(Typography)

### 2. 색상(Color)

### 3. 그리드(Grid)

### 4. 아이소타이프(ISOTYPE)

## 애드워드 튜페의 시각정보 디자인 7원칙

<pre>
<b>1. 시각적인 비교를 강화한다.</b>
   정보는 <b>비교</b>를 통해 사용자에게 더욱더 의미있게 된다. 
   관련된 변수와 추세를 비교할 수 있는 도구를 제시해야 한다. 
   
<b>2. 인과관계를 제시한다.</b>
   원인과 결과를 명확하게 제시해야 한다.

<b>3. 다차원 변수를 표시한다.</b>
   <b>관련 있는 여러개의 변수</b>를 이용하여 정보를 표현한다.

<b>4. 데이터, 텍스트, 그래픽을 한 화면에 효과적인 정보전달을 위해 어울리도록 배치한다.</b>
   <b> 범례와 레이블 </b>이 포함된 경우 정보 전달이 효과적이다.

<b>5. 콘텐츠의 질과 연관성, 진실성을 명확하게 한다.</b>
   시각화하려는 정보가 사용자의 목적을 달성하는데 유익한 것인가? 고민해야 한다.

<b>6. 시간적인 순서가 아니라 공간적인 순서로 배치한다.</b>
   시간보다는 공간에 따라 배치해야 한다. 사용자의 이해가 쉬워진다.

<b>7. 정량적 자료에 대한 양적 성질을 제거하지 말아야 한다.</b>
   그래프나 차트로 표현이 가능하다. 한눈에 양적인 정보를 파악할 수 있다.

</pre>

### 수행 내용 : 그래픽 품질 향상하기

<pre>
<b> 7가지 요소를 잘 표현하고 있는지 확인 </b>
1. 시각적 비교를 강화한다.
2. 인과관계를 제시한다.
3. 다차원 변수를 표시한다.
4. 텍스트, 그래픽, 데이터를 한 화면에 조화롭게 배치한다.
5. 콘텐츠의 질과 연관성, 진실성을 분명히 한다.
6. 시간 순서가 아닌 공간 순서로 나열한다.
7. 정량적 자료의 정량성을 제거하지 않는다.
</pre>

### 2. 그래프에서 정보 전달 효과를 높이기 위해 수정하거나 강조할 그래픽 요소를 선택하여 전달 요소를 강조한다.


<img src="img/img02.png">

### 3. 색과 모양을 이용하여 강조한다.

<img src="img/img03.png">

### 4. 밝기(명도 lightness/value)를 이용하여 전달 요소를 강조한다.

<img src="img/img04.png">

### 5. 질감을 이용하여 전달 요소를 강조한다.

<img src="img/img05.png">

## [3] 타이포그래피, 그리드, 색상, 아이소타이프 등의 그래픽 디자인 원리 적용

### 1. 타이포그래프 통해 그래프 품질 향상
<pre>
이 가이드 요소에 대한 서체, 글자의 무게,
크기, 색채, 스타일, 간격 등을 조정하여 그래프의 품질을 향상

이 막대 그래프에서 X축과, Y축의 축 제목, 데이터 값에 대한 레이블, 그래프
제목 등의 가이드 요소별로 서체와 글자 크기, 굵기가 다르다
</pre>

<b> 서체와 무게 </b>
<img src="img/img06.png">

<b> 크기와 색채 </b>
<img src="img/img07.png">

<b> 스타일과 간격 </b>
<b>  </b>

## 2. 색상을 통해 그래프 품질을 향상한다

<pre>
(1) 구분 표현
   정보를 분류하거나 묶기 위해 구분이 색상들을 선택하여 표현한다.
(2) 순서 표현
   정보의 순서 등 위계를 표현하는 경우 색의 채도나 색의 스펙트럼 변화를 이용한다.
   색상 팔레트를 활용하면 좀 더 쉽게 색상을 통한 순서상 표현을 할 수 있다,
(3) 비율 표현
   비율은 연속된 크기순으로 표시하되 0을 중심으로 명도를 단계별로 변화를 주어 표시
   하고, 위와 아래의 작은 수치들은 보색 대비가 되는 두 가지 색을 선택하여 사용한다.
   만약 회색을 기준 색으로 하여 0으로 두고 빨간색이 늘어나면 부정적이 수치가 증가
   하는 것이고, 녹색이 늘어나면 긍정적 수치가 증가하는 것으로 표현할 수 있다
</pre>

https://www.theguardian.com/news/datablog/2010/may/17/uk-public-spending-departments-money-cuts

<pre>
2008년과 2009년 공공 부문에 대한 영국 정부 비용을 부처별로 쪼개어 보여준 것이다.
즉, 정량적인 의미나 범주 구분을 위해 색상을 사용하지 않았다.
장식적인 기능으로 색상을 사용하여 매력적인 시각화로 만듬.
</pre>

## 3. 그리드를 통해 그래프 품질을 향상한다.

## <참조-Reference>

https://bioboot.github.io/bggn213_f17/class-material/08_draw_lecture_plots2/
