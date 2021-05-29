[38;2;249;38;114mlocal[0m[38;2;248;248;242m html = [0m[3;38;2;102;217;239mimport[0m[38;2;248;248;242m [0m[38;2;230;219;116m'html.libsonnet'[0m[38;2;248;248;242m;[0m
[38;2;249;38;114mlocal[0m[38;2;248;248;242m jekyll = [0m[3;38;2;102;217;239mimport[0m[38;2;248;248;242m [0m[38;2;230;219;116m'jekyll.libsonnet'[0m[38;2;248;248;242m;[0m
[38;2;249;38;114mlocal[0m[38;2;248;248;242m content = [0m[3;38;2;102;217;239mimport[0m[38;2;248;248;242m [0m[38;2;230;219;116m'stdlib-content.jsonnet'[0m[38;2;248;248;242m;[0m

[38;2;249;38;114mlocal[0m
[38;2;248;248;242m  h1 = html.h1,[0m
[38;2;248;248;242m  p = html.p;[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m manifestJsonSingleLine(val) = [0m[38;2;102;217;239mstd.strReplace[0m[38;2;248;248;242m([0m[38;2;102;217;239mstd.manifestJsonEx[0m[38;2;248;248;242m(val, [0m[38;2;230;219;116m''[0m[38;2;248;248;242m), [0m[38;2;230;219;116m'[0m[38;2;190;132;255m\n[0m[38;2;230;219;116m'[0m[38;2;248;248;242m, [0m[38;2;230;219;116m' '[0m[38;2;248;248;242m);[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m exampleDoc(ex) =[0m
[38;2;248;248;242m  [0m[38;2;249;38;114mlocal[0m[38;2;248;248;242m exRep =[0m
[38;2;248;248;242m    [0m[38;2;249;38;114mif[0m[38;2;248;248;242m [0m[38;2;102;217;239mstd.isString[0m[38;2;248;248;242m(ex) [0m[38;2;249;38;114mthen[0m
[38;2;248;248;242m      ex[0m
[38;2;248;248;242m    [0m[38;2;249;38;114melse[0m
[38;2;248;248;242m      html.spaceless([html.code({}, ex.input), [0m[38;2;230;219;116m' yields '[0m[38;2;248;248;242m, html.code({}, manifestJsonSingleLine(ex.output))])[0m
[38;2;248;248;242m  ;[0m
[38;2;248;248;242m  html.p({}, html.spaceless([[0m[38;2;230;219;116m'Example: '[0m[38;2;248;248;242m, exRep, [0m[38;2;230;219;116m'.'[0m[38;2;248;248;242m]))[0m
[38;2;248;248;242m;[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m hgroup(body) = html.div({ [0m[38;2;166;226;46mclass:[0m[38;2;248;248;242m [0m[38;2;230;219;116m'hgroup'[0m[38;2;248;248;242m }, body);[0m
[38;2;249;38;114mlocal[0m[38;2;248;248;242m hgroup_inline(body) = html.div({ [0m[38;2;166;226;46mclass:[0m[38;2;248;248;242m [0m[38;2;230;219;116m'hgroup-inline'[0m[38;2;248;248;242m }, [body, [0m[38;2;230;219;116m'<div style="clear: both"></div>'[0m[38;2;248;248;242m]);[0m
[38;2;249;38;114mlocal[0m[38;2;248;248;242m panel(body) = html.div({ [0m[38;2;166;226;46mclass:[0m[38;2;248;248;242m [0m[38;2;230;219;116m'panel'[0m[38;2;248;248;242m }, body);[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m in_panel(body) = hgroup(hgroup_inline(panel(body)));[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m fieldParams(f) =[0m
[38;2;248;248;242m  [0m[38;2;249;38;114mif[0m[38;2;248;248;242m [0m[38;2;102;217;239mstd.objectHas[0m[38;2;248;248;242m(f, [0m[38;2;230;219;116m'params'[0m[38;2;248;248;242m) [0m[38;2;249;38;114mthen[0m
[38;2;248;248;242m    [0m[38;2;230;219;116m'('[0m[38;2;248;248;242m + [0m[38;2;102;217;239mstd.join[0m[38;2;248;248;242m([0m[38;2;230;219;116m', '[0m[38;2;248;248;242m, f.params) + [0m[38;2;230;219;116m')'[0m
[38;2;248;248;242m  [0m[38;2;249;38;114melse[0m
[38;2;248;248;242m    [0m[38;2;230;219;116m''[0m
[38;2;248;248;242m;[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m fieldDescription(f) =[0m
[38;2;248;248;242m  [0m[38;2;249;38;114mif[0m[38;2;248;248;242m [0m[38;2;102;217;239mstd.isString[0m[38;2;248;248;242m(f.description) [0m[38;2;249;38;114mthen[0m
[38;2;248;248;242m    html.p({}, f.description)[0m
[38;2;248;248;242m  [0m[38;2;249;38;114melse[0m
[38;2;248;248;242m    f.description[0m
[38;2;248;248;242m;[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m fieldDoc(f, prefix) =[0m
[38;2;248;248;242m  [[0m
[38;2;248;248;242m    in_panel(html.h4({ [0m[38;2;166;226;46mid:[0m[38;2;248;248;242m f.name }, prefix + [0m[38;2;230;219;116m'.'[0m[38;2;248;248;242m + f.name + fieldParams(f))),[0m
[38;2;248;248;242m    in_panel([[0m
[38;2;248;248;242m      [0m[38;2;249;38;114mif[0m[38;2;248;248;242m [0m[38;2;102;217;239mstd.objectHas[0m[38;2;248;248;242m(f, [0m[38;2;230;219;116m'availableSince'[0m[38;2;248;248;242m) [0m[38;2;249;38;114mthen[0m[38;2;248;248;242m ([0m
[38;2;248;248;242m        html.p([0m
[38;2;248;248;242m          {},[0m
[38;2;248;248;242m          html.em([0m
[38;2;248;248;242m            {},[0m
[38;2;248;248;242m            [0m[38;2;249;38;114mif[0m[38;2;248;248;242m f.availableSince == [0m[38;2;230;219;116m'upcoming'[0m[38;2;248;248;242m [0m[38;2;249;38;114mthen[0m
[38;2;248;248;242m              [0m[38;2;230;219;116m'Available in upcoming release.'[0m
[38;2;248;248;242m            [0m[38;2;249;38;114melse[0m
[38;2;248;248;242m              [0m[38;2;230;219;116m'Available since version '[0m[38;2;248;248;242m + f.availableSince + [0m[38;2;230;219;116m'.'[0m
[38;2;248;248;242m          )[0m
[38;2;248;248;242m        )[0m
[38;2;248;248;242m      ),[0m
[38;2;248;248;242m      fieldDescription(f),[0m
[38;2;248;248;242m      [0m[38;2;249;38;114mif[0m[38;2;248;248;242m [0m[38;2;102;217;239mstd.objectHas[0m[38;2;248;248;242m(f, [0m[38;2;230;219;116m'examples'[0m[38;2;248;248;242m) [0m[38;2;249;38;114mthen[0m[38;2;248;248;242m [[0m
[38;2;248;248;242m        exampleDoc(ex)[0m
[38;2;248;248;242m        [0m[38;2;249;38;114mfor[0m[38;2;248;248;242m ex [0m[38;2;249;38;114min[0m[38;2;248;248;242m f.examples[0m
[38;2;248;248;242m      ] [0m[38;2;249;38;114melse[0m[38;2;248;248;242m [],[0m
[38;2;248;248;242m    ]),[0m
[38;2;248;248;242m    [0m[38;2;230;219;116m''[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m  ];[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m group(group_spec, prefix) =[0m
[38;2;248;248;242m  [[0m
[38;2;248;248;242m    in_panel(html.h3({ [0m[38;2;166;226;46mid:[0m[38;2;248;248;242m group_spec.id }, group_spec.name)),[0m
[38;2;248;248;242m    [0m[38;2;249;38;114mif[0m[38;2;248;248;242m [0m[38;2;102;217;239mstd.objectHas[0m[38;2;248;248;242m(group_spec, [0m[38;2;230;219;116m'intro'[0m[38;2;248;248;242m) [0m[38;2;249;38;114mthen[0m[38;2;248;248;242m in_panel(group_spec.intro),[0m
[38;2;248;248;242m    [0m[38;2;230;219;116m''[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m    [fieldDoc(f, prefix) [0m[38;2;249;38;114mfor[0m[38;2;248;248;242m f [0m[38;2;249;38;114min[0m[38;2;248;248;242m group_spec.fields],[0m
[38;2;248;248;242m    [0m[38;2;230;219;116m''[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m  ];[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m stdlibPage = [[0m
[38;2;248;248;242m  in_panel(html.h1({[0m[38;2;166;226;46mid:[0m[38;2;248;248;242m [0m[38;2;230;219;116m'standard_library'[0m[38;2;248;248;242m}, [0m[38;2;230;219;116m'Standard Library'[0m[38;2;248;248;242m)),[0m
[38;2;248;248;242m  [0m[38;2;230;219;116m''[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m  in_panel(content.intro),[0m
[38;2;248;248;242m  [0m[38;2;230;219;116m''[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m  [group(g, content.prefix) [0m[38;2;249;38;114mfor[0m[38;2;248;248;242m g [0m[38;2;249;38;114min[0m[38;2;248;248;242m content.groups],[0m
[38;2;248;248;242m];[0m

[38;2;249;38;114mlocal[0m[38;2;248;248;242m stdlibFrontMatter = {[0m
[38;2;248;248;242m  [0m[38;2;166;226;46mlayout:[0m[38;2;248;248;242m [0m[38;2;230;219;116m'default'[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m  [0m[38;2;166;226;46mtitle:[0m[38;2;248;248;242m [0m[38;2;230;219;116m'Standard Library'[0m[38;2;248;248;242m,[0m
[38;2;248;248;242m};[0m

[38;2;248;248;242mjekyll.renderWithFrontMatter(stdlibFrontMatter, stdlibPage)[0m