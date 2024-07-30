--- fig-code-chunk.lua – transforms Figure element into Rmarkdown style figure chunk. 
---
--- Copyright: © 2024 Abhishek Ulayil
--- License: MIT – see LICENSE for details

-- Makes sure users know if their pandoc version is too old for this
-- filter.
PANDOC_VERSION:must_be_at_least '3.1'

filter_image = {
  Image = function(img)
      table.insert(figure_src,img.src)
      local img_attr = img.attributes[1]
      local width = "100%"
      if img_attr == nil then
        width = "100%"
      else
        attribute_1 = img.attributes 
        if img.attributes[1][2]:match('%\\') then
          width = tonumber(attribute_1[1][2]:match('%d+.%d+'))
          -- if width is defined but not parsed by pandoc
          if(attribute_1[1][2]:match('%d+.%d+') == nil) then
            width = "100%"
          -- if width is defined but is in raw form like [width=0.35\linewidth] in LaTeX
          else
            width = tostring(width*100) .. "%"
          end
        -- if width is defined and parsed as percentage by pandoc
        elseif(attribute_1[1][2]:match('%d%%') ~= nil) then
          width = attribute_1[1][2]
        -- default width handling at 100%
        else
          width = "100%"
        end
      end
      table.insert(figure_width,width)
  end
}

function Figure(fig)
  
  figure_src = {}
  figure_width = {}
  -- identifier % label
  local identifier = fig.identifier
  -- caption % need to stringify
  local caption = pandoc.utils.stringify(fig.caption)
  -- alt % default alt text for images
  local alt = "graphic without alt text"
  -- alignment % default center
  local alignment = "center"
  pandoc.walk_block(fig,filter_image)
  local_raw_block_table = {}
  local attr_construct= [[```{r ]] .. identifier ..[[, echo=FALSE , fig.cap="]] .. caption .. [[", fig.alt="]].. alt .. [[", fig.align=]].. alignment..[[}]] .. string.char(10)
  -- if single image and width defined
  if #figure_src == 1 then
    attr_construct= [[```{r ]] .. identifier ..[[, echo=FALSE , fig.cap="]] .. caption .. [[", fig.alt="]] .. alt .. [[", fig.align=]].. alignment ..[[, out.width="]] .. figure_width[1] .. [["}]] .. string.char(10)    
  end
  table.insert(local_raw_block_table,attr_construct)
  for i = 1,#figure_src,1 do
    local knitr_command='knitr::include_graphics("'.. figure_src[i] ..'")' .. string.char(10)
    table.insert(local_raw_block_table,knitr_command)
  end
  local attr_end = [[```]]
  table.insert(local_raw_block_table,attr_end)
  -- Markdown Rawblock to replace the existing Figure element
  knitr_block = pandoc.RawInline('markdown', pandoc.utils.stringify(local_raw_block_table))
  return knitr_block
end
