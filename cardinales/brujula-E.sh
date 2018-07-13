declare -a OP_TEAM=(Arani Capinota Quillacollo Punata)
declare -i INDEX INPUT_TEAM
declare -A TEAM_Q_A=( ["Q1"]=3 ["Q2"]=1 ["Q3"]=2 ["Q4"]=4 )
declare TEAM_QUESTION=Q2

QUESTION_1="¿Dónde se celebra la festividad de la Virgen de Urkupiña?"
QUESTION_2="¿Dónde se elabora el pan traducional cochabambino?"
QUESTION_3="¿Cuál es la provincia de orígen de los Kjarkas?"
QUESTION_4="¿Dónde se elaboran los mejores rosquetes?"

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
