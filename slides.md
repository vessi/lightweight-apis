class: center,middle

![mRuby logo](/images/mruby_logo_red_icon.png)
# Lightweight APIs in mRuby
---
# Who am I
---
# Who am I

* Name's **Mikhail Bortnyk**
---
# Who am I

* Name's **Mikhail Bortnyk**
* Ruby developer and team leader in R&R Music Ukraine
---
# Who am I

* Name's **Mikhail Bortnyk**
* Ruby developer and team leader in R&R Music Ukraine
* Co-creator of [Kottans school](http://kottans.org)
---
# Who am I

* Name's **Mikhail Bortnyk**
* Ruby developer and team leader in R&R Music Ukraine
* Co-creator of [Kottans school](http://kottans.org)
* Geek, polyglot, software development addict
---
# Who am I

* Name's **Mikhail Bortnyk**
* Ruby developer and team leader in R&R Music Ukraine
* Co-creator of [Kottans school](http://kottans.org)
* Geek, polyglot, software development addict
* github: [@vessi](https://github.com/vessi)
---
# Who am I

* Name's **Mikhail Bortnyk**
* Ruby developer and team leader in R&R Music Ukraine
* Co-creator of [Kottans school](http://kottans.org)
* Geek, polyglot, software development addict
* github: [@vessi](https://github.com/vessi)
* twitter: [@mikhailbortnyk](https://twitter.com/mikhailbortnyk)
---
# What is mRuby
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
* can be linked and embedded into your application
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
* can be linked and embedded into your application
* can compile your software into bytecode
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
* can be linked and embedded into your application
* can compile your software into bytecode
* can generate C code for embedding bytecode
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
* can be linked and embedded into your application
* can compile your software into bytecode
* can generate C code for embedding bytecode
* author: Yukihiro 'matz' Matsumoto
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
* can be linked and embedded into your application
* can compile your software into bytecode
* can generate C code for embedding bytecode
* author: Yukihiro 'matz' Matsumoto
* github: [github://mruby/mruby](https://github.com/mruby/mruby/)
---
# What is mRuby

* mRuby is lightweight implementation of Ruby complying (partially) to ISO/IEC 30170:2012
* can be linked and embedded into your application
* can compile your software into bytecode
* can generate C code for embedding bytecode
* author: Yukihiro 'matz' Matsumoto
* github: [github://mruby/mruby](https://github.com/mruby/mruby/)
* latest version: `1.1.0`
---
class: center
# Typical Rails project

<p align="center">
  <img src="/images/bug1.svg" width="80%" height="80%" />
</p>
---
# Typical Rails project (I am so sorry for it, mom!)
---
# Typical Rails project

* it's based on Rack
---
# Typical Rails project

* it's based on Rack
* it contains a lot of business processes
---
# Typical Rails project

* it's based on Rack
* it contains a lot of business processes
* it responds to many routes
---
# Typical Rails project

* it's based on Rack
* it contains a lot of business processes
* it responds to many routes
* often too heavy to serve tons of lightweight requests without scaling
---
# Typical Rails project

* it's based on Rack
* it contains a lot of business processes
* it responds to many routes
* often too heavy to serve tons of lightweight requests without scaling

So, what is the solution?
---
# Solutions
---
# Solutions

* You have a problem and decide to use threads. Two now problems have you.
---
# Solutions

* You have a problem and decide to use threads. Two now problems have you.
* You have a problem and decide to use functional languages. Now your problems are immutable.
---
# Solutions

* You have a problem and decide to use threads. Two now problems have you.
* You have a problem and decide to use functional languages. Now your problems are immutable.
* You have a problem and decide to use Java. Now you have `ProblemsFactory`.
---
# Solutions

* You have a problem and decide to use threads. Two now problems have you.
* You have a problem and decide to use functional languages. Now your problems are immutable.
* You have a problem and decide to use Java. Now you have `ProblemsFactory`.
* You have a problem and decide...
---
class: center, middle

# Kill it with fire!
---
class: center, middle

# ~~Kill it with fire!~~
# Microservices
---
class: center

# Microservices

<p align="center">
  <img src="/images/bug2.svg" height="80%" width="80%" />
</p>
---
# Microservices
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
* be lightweight
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
* be lightweight
* be stable
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
* be lightweight
* be stable
* don't switch technology stack aggresively
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
* be lightweight
* be stable
* don't switch technology stack aggresively

So, I decided to use mRuby. What do we have for serving web here?
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
* be lightweight
* be stable
* don't switch technology stack aggresively

So, I decided to use mRuby. What do we have for serving web here?

* `mod_mruby`. Apache module that executes mRuby code inside Apache process.
---
# Microservices

The idea is to split big project in bunch of independent lightweight services.

Requirements:

* be fast
* be lightweight
* be stable
* don't switch technology stack aggresively

So, I decided to use mRuby. What do we have for serving web here?

* `mod_mruby`. Apache module that executes mRuby code inside Apache process.
* `ngx_mruby`. Perfectly the same but with Nginx flavour.
---
class: center

# Little demonstration
##### Microservice without any service

<p align="center">
  <img src="/images/bug3.svg" width="70%" height="70%" />
</p>
---
# Little demonstration

Used software:

* `nginx` (ALL)
* `docker` (ALL)
* `docker-compose` (ALL)
* `mongodb` (ALL)
* `ab` (ALL)
* `unicorn` gem (rack)
* `rack` gem (rack)
* `rack-routing` gem (rack)
* `mongo` gem (rack)
* `ngx_mruby` (mRuby)
* `mruby-mongo` (mRuby)
---
# Rack execution

```shell
$> cd testlab/rack
$> docker-compose up
$> ab -n 10000 -c 100 http://192.168.0.100:10080/api/contacts
# and kill docker-compose with ^C
```
---
# Rack stats (page 1)

```
Document Path:          /api/contacts
Document Length:        537 bytes

Concurrency Level:      100
Time taken for tests:   7.897 seconds
Complete requests:      10000
Failed requests:        4399
   (Connect: 0, Receive: 0, Length: 4399, Exceptions: 0)
Non-2xx responses:      5601
Total transferred:      5080859 bytes
HTML transferred:       3434440 bytes
Requests per second:    1266.27 [#/sec] (mean)
Time per request:       78.972 [ms] (mean)
Time per request:       0.790 [ms] (mean, across all concurrent requests)
Transfer rate:          628.29 [Kbytes/sec] received
```
---
# Rack stats (page 2)

```
Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    4   4.1      2      34
Processing:     1   74  72.1     23     423
Waiting:        1   74  72.0     22     423
Total:          2   78  72.2     27     426

Percentage of the requests served within a certain time (ms)
  50%     27
  66%    135
  75%    147
  80%    154
  90%    174
  95%    192
  98%    216
  99%    232
 100%    426 (longest request)
 ```
---
# mRuby execution

```shell
$> cd testlab/rack
$> docker-compose up
$> ab -n 10000 -c 100 http://192.168.0.100:10080/api/contacts
# and kill docker-compose with ^C
```
---
# mRuby stats (page 1)

```
Document Path:          /api/contacts
Document Length:        98 bytes

Concurrency Level:      100
Time taken for tests:   6.721 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2140000 bytes
HTML transferred:       980000 bytes
Requests per second:    1487.83 [#/sec] (mean)
Time per request:       67.212 [ms] (mean)
Time per request:       0.672 [ms] (mean, across all concurrent requests)
Transfer rate:          310.93 [Kbytes/sec] received
```
---
# mRuby stats (page 2)

```
Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    3   5.9      0      29
Processing:     5   64  27.5     68     132
Waiting:        5   64  27.6     68     131
Total:         14   67  24.4     69     132

Percentage of the requests served within a certain time (ms)
  50%     69
  66%     78
  75%     83
  80%     88
  90%    102
  95%    106
  98%    112
  99%    120
 100%    132 (longest request)
```
---
class: center, top
# Problems
<p align="center">
  <img src="/images/bug4.svg" width="70%" height="70%" />
</p>
---
# Problems

Everything has its price. `ngx_mruby` and Nginx and mRuby are not exceptions.
---
# Problems

Everything has its price. `ngx_mruby` and Nginx and mRuby are not exceptions.

* you have to recompile mRuby each time you add some dependency
---
# Problems

Everything has its price. `ngx_mruby` and Nginx and mRuby are not exceptions.

* you have to recompile mRuby each time you add some dependency
* oftenly gems are written in pure C
---
# Problems

Everything has its price. `ngx_mruby` and Nginx and mRuby are not exceptions.

* you have to recompile mRuby each time you add some dependency
* oftenly gems are written in pure C
* mRuby has no `require` keyword, so you code will not be so DRY as you want
---
# Problems

Everything has its price. `ngx_mruby` and Nginx and mRuby are not exceptions.

* you have to recompile mRuby each time you add some dependency
* oftenly gems are written in pure C
* mRuby has no `require` keyword, so you code will not be so DRY as you want
* still not so fast as pure C implementation :(
---
class: center, middle

# Questions?
---
class: center, top
# Thank you!

<p align="center">
  <img src="/images/bug5.svg" width="70%" height="70%" />
</p>
