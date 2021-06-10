set -e

echo "\n\n*** Docker ***";

{
  docker system prune -a -f --volumes
} || { 
  echo "Docker fail"
}


echo "\n\n*** Gradle ***";
rm -rf ~/.gradle/caches/
rm -rf $ANDROID_HOME/cache/
rm -rf $ANDROID_HOME/build-cache/

echo "\n\n*** Yarn ***";

yarn cache clean

echo "*** Finish ***"