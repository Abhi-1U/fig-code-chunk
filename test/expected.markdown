## Figure with single image

```{r figure:rlogo, echo=FALSE , fig.cap="The logo of R.", fig.alt="graphic without alt text", fig.align="center", out.width="35%"}
knitr::include_graphics(c("Rlogo-5.png"))
```

## Figure with Multiple images

```{r figure:rlogo2, echo=FALSE , fig.cap="Two logos of R.", fig.alt="graphic without alt text", fig.align="center"}
knitr::include_graphics(c("Rlogo-5.png","Rlogo-5-alt.png"))
```

## CodeBlock in Figure environment

<figure id="code:helloworld">
<pre><code>    print(&quot;Hello World&quot;)</code></pre>
<figcaption>Hello World!</figcaption>
</figure>
