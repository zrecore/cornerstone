case "$ENV" in 
    "PROD")
        source "$HOME/setup/config.prod.sh"
        echo "*** PROD MODE ***"
        ;;
    "BETA")
        source "$HOME/setup/config.beta.sh"
        echo "*** BETA MODE ***"
        ;;
    "DEV")
        source "$HOME/setup/config.dev.sh"
        echo "*** DEV MODE ***"
        ;;
    "LOCAL")
        ;&
    *)
        source "$HOME/setup/config.local.sh"
        echo "*** LOCAL MODE ***"
        ;;
esac