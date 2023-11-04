echo "--------------------------"
echo "User Name: 김성민"
echo "Student Number: 12223538"
echo "[ MENU ]"
echo "1. Get the data of the movie identified by a specific 'movie id' from 'u.item'"
echo "2. Get the data of action genre movies from 'u.item'"
echo "3. Get the average 'rating' of the movie identified by specific 'movie id' from 'u.data'"
echo "4. Delete the 'IMDb URL' from 'u.item'"
echo "5. Get the data about users from 'u.user'"
echo "6. Modify the format of 'release date' in 'u.item'"
echo "7. Get the data of movies rated by a specific 'user id' from 'u.data'"
echo "8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'"
echo "9. Exit"
echo "--------------------------"

while true; do
    read -p "Enter your choice [ 1-9 ] " choice

    case $choice in
        1)
            read -p "Please enter 'movie id'(1~1682):" movie_id
	    awk -F '|' -v movie_id="$movie_id" '$1 == movie_id' u.item
            ;;
        2)
            read -p "Do you want to get the data of 'action' genre movies from 'u.item'? (y/n):" choice
            if [ "$choice" == "y" ]; then
		awk -F '|' '$7 == "1" { print $1, $2 }' u.item | sort -n | head -10
	    fi
            ;;
        3)
            read -p "Please enter 'movie id'(1~1682):" movie_id
	    awk -F '\t' -v movie_id="$movie_id" '$2 == movie_id { total += $3; count++ } END { if (count > 0) printf "average rating of %d: %.5f\n", movie_id, total / count }' u.data
            ;;
        4)
            read -p "Do you want to delete the 'IMDb URL' from 'u.item'? (y/n):" choice
	    if [ "$choice" == "y" ]; then
		head -n 10 u.item | sed 's/http:\/\/us.imdb.com[^|]*//g'
	    fi
            ;;
        5)
            read -p "Do you want to get the data of 'action' genre movies from 'u.user'? (y/n):" choice
	    if [ "$choice" == "y" ]; then
		awk -F '|' '{ printf("user %d is %d years old %s %s\n", $1, $2, ($3=="M"?"male":"female"), $4) }' u.user | head -10
	    fi
            ;;
        6)
            read -p "Do you want to Modify the format of 'release data' in 'u.item'? (y/n):" choice
	    if [ "$choice" == "y" ]; then
		cat u.item | awk -F '|' '{split($3, date_parts, "-")
		    month = sprintf("%02d", (index("JanFebMarAprMayJunJulAugSepOctNovDec", date_parts[2]) + 2) / 3)
		    new_date = date_parts[3] month date_parts[1]
		    printf "%s|%s|%s|%s", $1, $2, new_date, $4
		    for (i = 5; i <= NF; i++) {
			printf "|%s", $i
		    }
		    print ""}' | tail -10
	    fi
            ;;
        7)
            read -p "Please enter the 'user id'(1~943):" user_id
	    user_ratings=$(grep -w "^$user_id" u.data | cut -f2)
	    sorted_ratings=$(echo "$user_ratings" | sort -t$'\t' -k1,1n | tr '\n' '|')
	    sorted_ratings="${sorted_ratings%|}"
	    echo "$sorted_ratings"
	    IFS='|' read -ra movie_ids <<< "$sorted_ratings"
	    for ((i = 0; i < 10 && i < ${#movie_ids[@]}; i++)); do
		movie_id="${movie_ids[i]}"
		movie_info=$(grep -w "^$movie_id" u.item)
	        movie_title=$(echo "$movie_info" | cut -d '|' -f2)
	        echo "$movie_id|$movie_title"
	    done
            ;;
        8)
	    read -p "Do you want to get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'?(y/n):" choice
	    if [ "$choice" == "y" ]; then
		user_ids=$(awk -F '|' '$2 >= 20 && $2 <= 29 && $4 == "programmer" {print $1}' u.user)
		filtered_ratings=$(grep -wFf <(echo "$user_ids") u.data)
		awk -F '\t' '{
		  movie_id = $2;
		  rating = $3;
		  sum[movie_id] += rating;
		  count[movie_id]++;
		}
		END {
		  for (movie_id in sum) {
		    avg_rating = sum[movie_id] / count[movie_id];
		    sub(/\.?0+$/, "", avg_rating);
		    printf "%d %s\n", movie_id, avg_rating;
		  }
		}' <(echo -e "$filtered_ratings") | sort -n
	    fi
            ;;
        9)
            echo "Bye!"
            exit 0
            ;;
    esac
done
