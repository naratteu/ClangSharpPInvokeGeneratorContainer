NAME=naratteu/clangsharppinvokegenerator
docker build . -t $NAME:latest -t $NAME:20250213
docker push $NAME:latest
docker push $NAME:20250213

# todo : 동적 태그 적용? 깃헙액션연동?