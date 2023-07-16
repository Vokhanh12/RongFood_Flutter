for i in 1 
do
cowsay -f dragon setting settup now
export PATH="$PATH":"$HOME/.pub-cache/bin"
dart pub global activate flutterfire_cli
flutterfire configure
done
