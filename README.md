課題1-2

課題1-1でt/template.t のテストがうまくいかなかったため、代わりに、template/main.htmlを書き換え、
template.pmを拡張した。

main.plのなかで、

print $template->render({
  title   => 'タイトル',
  content => 'これはコンテンツです',
  image => 'img/img.gif',
}); 
としたとき、画像(image)が表示されるようにした。

