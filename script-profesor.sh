declare -a OP_TEAM=(La_Chilindrina Goku Paris Homero)
declare -i INDEX INPUT_TEAM
declare -A TEAM_Q_A=( ["Q1"]=4 ["Q2"]=2 ["Q3"]=3 ["Q4"]=1 )
#declare TEAM_QUESTION=Q3
NUMERO_RANDOM=$(( $RANDOM % 4+1 ))
echo $NUMERO_RANDOM
declare TEAM_QUESTION=Q$NUMERO_RANDOM

QUESTION_1="¿Cuál es nombre del papá de Lisa?"
QUESTION_2="¿Cómo se llama el guerrero super sayayin?"
QUESTION_3="¿Cuál es la capital de Francia?"
QUESTION_4="¿Cómo se llama la aimga del Chavo del ocho?"

# Shows a menu with team options.
function show_options {
    clear ; INDEX=0

    # Ask the question.
    case $TEAM_QUESTION in
        Q1) echo $QUESTION_1 ;;
        Q2) echo $QUESTION_2 ;;
        Q3) echo $QUESTION_3 ;;
        Q4) echo $QUESTION_4 ;;
    esac

    for i in ̈"${OP_TEAM[@]}"; do
        INDEX="$(expr $INDEX+1)"
        echo "$INDEX. $i"
    done
    echo "Por favor elige una opción [1-4]:"
}

# Call to the options function.
show_options

# Starts the menu loop.
while read INPUT_TEAM; do
    if [[ $INPUT_TEAM =~ ^[1-4]$ ]] ; then
        if [[ ! $INPUT_TEAM -eq ${TEAM_Q_A[$TEAM_QUESTION]} ]] ; then
            clear ; echo "Respuesta incorrecta." ; sleep 1
            show_options
        else
            clear ; echo "Por favor ve a ${OP_TEAM[$INPUT_TEAM-1]}..."
            exit 0
        fi
    else
        clear ; echo "Opción no válida." ; sleep 1
        show_options
    fi
done
