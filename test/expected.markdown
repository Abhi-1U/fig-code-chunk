## Figure with single image

```{r figurerlogo, echo=FALSE , fig.cap="The logo of R.", fig.alt="graphic without alt text", fig.show='hold', fig.align="center", out.width="35%"}
knitr::include_graphics(c("Rlogo-5.png"))
```

## Figure with Multiple images

```{r figurerlogo2, echo=FALSE , fig.cap="Two logos of R.", fig.alt="graphic without alt text", fig.show='hold', fig.align="center", out.width="49.5%"}
knitr::include_graphics(c("Rlogo-5.png","Rlogo-5-alt.png"))
```

## CodeBlock in Figure environment

<figure id="code:helloworld">
<pre><code>    print(&quot;Hello World&quot;)</code></pre>
<figcaption>Hello World!</figcaption>
</figure>
