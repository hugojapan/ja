set -x -o pipefail # -x: is for debugging

rm -rf hugoDocs
mkdir .ja
mv * .ja/
git clone --depth=1 -b japanese https://github.com/hugojapan/hugoDocs.git
cd hugoDocs
rm -rf ./content/ja
mv ../.ja ./content/ja
hugo --gc --minify --baseURL 'https://hugodocsja.netlify.com/'
echo -e 'User-agent: *\nDisallow: /' > public/robots.txt
