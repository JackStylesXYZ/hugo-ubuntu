#!/bin/bash

echo "What would you like to do?"
echo "1) Serve Hugo site"
echo "2) Open container terminal"
read -p "Enter choice [1 or 2]: " choice

if [[ "$choice" == "1" ]]; then
  echo "Starting Hugo server..."
  docker run -it --rm \
    -v "$(pwd)/site":/site \
    -v ~/.ssh:/root/.ssh \
    -p 1313:1313 \
    jackstyles/hugo-ubuntu \
    hugo server --source=/site --bind=0.0.0.0 --baseURL=http://localhost:1313

elif [[ "$choice" == "2" ]]; then
  echo ""
  echo "Opening container terminal..."
  echo ""
  echo "You can find the HUGO 'quick start' guid here: https://gohugo.io/getting-started/quick-start/"
  echo ""
  echo -e "To serve the site, run: \033[1;36mhugo server --source=/site --bind=0.0.0.0 --baseURL=http://localhost:1313\033[0m"
  echo ""
  docker run -it --rm \
    -v "$(pwd)/site":/site \
    -v ~/.ssh:/root/.ssh \
    -p 1313:1313 \
    jackstyles/hugo-ubuntu \
    bash -c "echo 'You are now in the container. Use hugo commands as needed.'; echo ''; exec bash"
else
  echo "Invalid choice. Exiting."
fi
