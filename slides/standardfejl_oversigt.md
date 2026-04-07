---
title: "Oversigt over standardfejl"
format:
  html:
    toc: false
---

# Standardfejl — hvad er det?

Standardfejlen er usikkerheden på vores estimat.

Den fortæller os, hvor meget estimatet ville variere fra stikprøve til stikprøve, hvis vi tog "tilstrækkeligt mange" stikprøver.

Helt generelt gælder:

$$
\text{teststørrelse} = \frac{\text{estimat} - \text{hypotese}}{SE}
$$

Så når vi skal lave hypotesetests eller beregne konfidensintervaller, er standardfejlen det afgørende led.

# De vigtigste situationer

## 1. Én middelværdi

Hvis vi har en stikprøve med middelværdi $\bar{x}$, standardafvigelse $s$ og størrelse $n$, er standardfejlen:

$$
SE(\bar{x}) = \frac{s}{\sqrt{n}}
$$

Her er:

- $s$: stikprøvens standardafvigelse
- $n$: antal observationer

Jo større $n$ er, desto mindre bliver standardfejlen.

## 2. Forskel mellem to middelværdier (ikke-parret)

Når vi sammenligner to uafhængige grupper, er estimatet (praktisk taget altid) forskellen mellem middelværdierne:

$$
\bar{x}_1 - \bar{x}_2
$$

Standardfejlen er:

$$
SE(\bar{x}_1 - \bar{x}_2) = \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}
$$

Vi skriver ofte: $SE_{diff}$

Her er:

- $s_1, s_2$: standardafvigelserne i de to grupper
- $n_1, n_2$: stikprøvestørrelserne i de to grupper

Usikkerheden kommer derfor fra begge grupper.

## 3. Parrede målinger

Ved parrede data beregner vi først forskelle for hvert individ (eller hvad vi nu undersøger):

$$
d_i = x_i - y_i
$$

Derefter beregnes middelværdien af forskellene:

$$
\bar{d} = \frac{1}{n}\sum_{i=1}^n d_i
$$

Standardafvigelsen af forskellene er givet ved:

$$
s_d = \sqrt{\frac{1}{n-1}\sum_{i=1}^n (d_i - \bar{d})^2}
$$

Standardfejlen bliver så:

$$
SE(\bar{d}) = \frac{s_d}{\sqrt{n}}
$$

Det afgørende er altså, at vi arbejder med forskellene, ikke med de to måleserier hver for sig. I eksamenssituationer vil vi normalt få oplyst standardafvigelsen og antallet af observationer, og skal så beregne standardfejlen selv.

## 4. Én andel

Når vi estimerer en andel $p$, er standardfejlen givet ved:

$$
SE(p) = \sqrt{\frac{p(1-p)}{n}}
$$

Her er:

- $p$: den observerede andel
- $n$: stikprøvestørrelsen

Standardfejlen afhænger altså af selve andelen.

## 5. Forskel mellem to andele

Når vi sammenligner to andele, er standardfejlen givet ved:

$$
SE(p_1 - p_2) = \sqrt{\frac{p_1(1-p_1)}{n_1} + \frac{p_2(1-p_2)}{n_2}}
$$

Her er der igen bidrag fra begge grupper.

## 6. Odds ratio (OR)

For odds ratio arbejder vi på log-skala. Standardfejlen for $\log(OR)$ er:

$$
SE(\log(OR)) = \sqrt{\frac{1}{a} + \frac{1}{b} + \frac{1}{c} + \frac{1}{d}}
$$

hvor $a$, $b$, $c$, $d$ er cellerne i en 2x2-tabel.

Konfidensinterval og test laves på log-skala og kan bagefter transformeres tilbage ved at tage exponentialfunktionen. En klassisk fejl er at glemme at logaritmere estimatet.

## 7. Risk ratio (RR)

For risk ratio arbejder vi også på log-skala. Standardfejlen for $\log(RR)$ er:

$$
SE(\log(RR)) = \sqrt{\frac{1}{a} - \frac{1}{a+b} + \frac{1}{c} - \frac{1}{c+d}}
$$

Igen er $a$, $b$, $c$, $d$ cellerne i en 2x2-tabel.

Konfidensinterval og test laves på log-skala og kan bagefter transformeres tilbage ved at tage exponentialfunktionen. En klassisk fejl er at glemme at logaritmere estimatet.

### Hvad er hvad?

Vi antager en 2x2-tabel af formen:

$$
\begin{array}{c|cc}
 & \text{Udfald}=1 & \text{Udfald}=0 \\
\hline
\text{Eksponeret} & a & b \\
\text{Ikke-eksponeret} & c & d
\end{array}
$$

Her er risikoen i den eksponerede gruppe:

$$
\frac{a}{a+b}
$$

og risikoen i den ikke-eksponerede gruppe:

$$
\frac{c}{c+d}
$$



# Det gennemgående mønster

Ideen er den samme uanset situationen:

- mere variation giver større standardfejl
- større stikprøver giver mindre standardfejl

Man kan tænke det som:

$$
\text{standardfejl} \approx \frac{\text{spredning}}{\text{mængde data}}
$$

# Kobling til hypotesetest

Når vi har et estimat og dets standardfejl, kan vi beregne en teststørrelse:

$$
\frac{\text{estimat} - \text{hypotetisk værdi}}{SE}
$$

Det er den grundidé, der går igen i:

- z-tests
- t-tests
- tests for andele
- tests for OR og RR

# Kort opsummering

Det centrale er:

- først finder vi det rigtige estimat
- derefter finder vi standardfejlen for netop dét estimat
- så kan vi lave hypotesetest og konfidensintervaller


