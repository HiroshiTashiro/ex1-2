課題1-2

課題1-1でt/template.t のテストがうまくいかなかったため、代わりに、template/main.htmlを書き換え、
template.pmを拡張した。

main.plのなかで、

print $template->render({
  title   => 'タイトル',
  content => 'これはコンテンツです',
  image => 'img/img.gif',
}); 
としたとき、画像(img/img.gif)が表示されるようにした。(.gifでなくてもよい)

また、template/main.html中の{% datetime %}を置換し、現在の時刻が表示されるようにした。

$perl main.pl>output.html
とした結果が、output.htmlである。
