module.exports = function (eleventy) {
  eleventy.addPassthroughCopy({"src/assets": "assets"})
  eleventy.setTemplateFormats(["html", "liquid", "ejs", "md", "hbs", "mustache", "haml", "pug", "njk", "11ty.js", "xml"])

  eleventy.addFilter("ISOString", (v)=>v.toISOString())

  eleventy.dir = {
    input: "src",
  }

  return eleventy;

}
