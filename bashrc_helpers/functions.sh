function SetTitle {
  echo -ne "\033]0;$1\007"
}

function KeybindsNormal {
	echo "activating normal binds"
	sudo cp $HOME/dotfiles/keyd_normal.conf /etc/keyd/default.conf
	sudo systemctl restart keyd
}

function KeybindsGames {
	echo "activating gaming binds"
	sudo cp $HOME/dotfiles/keyd_gaming.conf /etc/keyd/default.conf
	sudo systemctl restart keyd
}

function SetPowerPerf {
	echo "activating performance power"
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_ON_AC=)[0-1]/\10/' /etc/laptop-mode/laptop-mode.conf
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_WHEN_LID_CLOSED=)[0-1]/\10/' /etc/laptop-mode/laptop-mode.conf
	sudo systemctl restart laptop-mode.service
}

function SetPowerBalanced {
	echo "activating balanced power"
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_ON_AC=)[0-1]/\11/' /etc/laptop-mode/laptop-mode.conf
    sudo sed -i -E 's/^(ENABLE_LAPTOP_MODE_WHEN_LID_CLOSED=)[0-1]/\11/' /etc/laptop-mode/laptop-mode.conf
	sudo systemctl restart laptop-mode.service
}

function SwitchGameConfigs {
	KeybindsGames && SetPowerPerf && sudo prime-switcher --set performance
}

function SwitchNormalConfigs {
	KeybindsNormal && SetPowerBalanced && sudo prime-switcher --set power-saving
}

function PrintColors {
	printf "|039| \033[39mDefault \033[m  |049| \033[49mDefault \033[m  |037| \033[37mLight gray \033[m     |047| \033[47mLight gray \033[m\n"
	printf "|030| \033[30mBlack \033[m    |040| \033[40mBlack \033[m    |090| \033[90mDark gray \033[m      |100| \033[100mDark gray \033[m\n"
	printf "|031| \033[31mRed \033[m      |041| \033[41mRed \033[m      |091| \033[91mLight red \033[m      |101| \033[101mLight red \033[m\n"
	printf "|032| \033[32mGreen \033[m    |042| \033[42mGreen \033[m    |092| \033[92mLight green \033[m    |102| \033[102mLight green \033[m\n"
	printf "|033| \033[33mYellow \033[m   |043| \033[43mYellow \033[m   |093| \033[93mLight yellow \033[m   |103| \033[103mLight yellow \033[m\n"
	printf "|034| \033[34mBlue \033[m     |044| \033[44mBlue \033[m     |094| \033[94mLight blue \033[m     |104| \033[104mLight blue \033[m\n"
	printf "|035| \033[35mMagenta \033[m  |045| \033[45mMagenta \033[m  |095| \033[95mLight magenta \033[m  |105| \033[105mLight magenta \033[m\n"
	printf "|036| \033[36mCyan \033[m     |046| \033[46mCyan \033[m     |096| \033[96mLight cyan \033[m     |106| \033[106mLight cyan \033[m\n"
}

# call as height=20 print_true_color
function PrintTrueColors {
    # Based on: https://gist.github.com/XVilka/8346728 and https://unix.stackexchange.com/a/404415/395213
    awk -v term_cols="${width:-$(tput cols || echo 80)}" -v term_lines="${height:-1}" 'BEGIN{
        s="/\\";
        total_cols=term_cols*term_lines;
        for (colnum = 0; colnum<total_cols; colnum++) {
            r = 255-(colnum*255/total_cols);
            g = (colnum*510/total_cols);
            b = (colnum*255/total_cols);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum%2+1,1);
            if (colnum%term_cols==term_cols) printf "\n";
        }
        printf "\n";
    }'
}

function YtDlpMp4 {
	yt-dlp -f "bv*+ba/b" --merge-output-format mp4 $1
}
