# Nue Houjuu ANSI art script by:
#   Reddit: u/mrniceguy127
#   GitHub: https://github.com/mrniceguy127
# 03/22/2020

#!/bin/sh

initializeANSI(){
  esc=""
  reset="${esc}[0m"

  border="${reset}${esc}[38;5;232m"  
  red="${reset}${esc}[38;5;9m"; redd="${reset}${esc}[38;5;160m"
  eyeb="${reset}${esc}[38;5;203m"; eyed="${reset}${esc}[38;5;196m"
  purpleb="${reset}${esc}[38;5;141m"
  clothd="${reset}${esc}[38;5;234m"; clothb="${reset}${esc}[38;5;238m"
  gray="${reset}${esc}[38;5;237m"; grayb="${reset}${esc}[38;5;238m"
  blue="${reset}${esc}[38;5;19m"; blued="${reset}${esc}[38;5;18m"
  hairb="${reset}${esc}[38;5;240m"; hair="${reset}${esc}[38;5;236m"; hairw="${reset}${esc}[38;5;242m"; haird="${reset}${esc}[38;5;235m"
  humand="${esc}[38;5;216m"; human="${esc}[38;5;223m"; humanb="${esc}[38;5;229m"
  whited="${reset}${esc}[38;5;251m"; white="${reset}${esc}[38;5;255m"
}

initializeANSI

cat << EOF

                  ${gray}██${reset}
                ${gray}██${reset}
                  ${gray}████${reset}    ${border}██████████${reset}
    ${border}██████${reset}            ${border}████${hairb}████████${haird}██${border}██████${reset}
  ${border}██${redd}██${border}██${redd}██${border}██${reset}      ${border}████${gray}████████████${hairb}████████${border}████${reset}        ${border}██████${reset}
  ${border}████${reset}  ${border}██${redd}██${border}██${reset}  ${border}██${gray}██${grayb}██████████${gray}████████████${hairb}████${border}██${reset}    ${border}██${blued}██████${border}██${reset}
  ${border}██${redd}██${border}██${redd}██████${border}██${grayb}██${hairw}██████${grayb}██████████████${gray}████████${border}██${reset}  ${border}██${blued}██${border}████${blued}██${border}████
${border}██${redd}████${border}████████${grayb}██████████${hair}██${hairw}██████${grayb}██${hairw}████${grayb}██${hair}██${grayb}██${gray}████${border}██${blued}██${border}██${reset}    ${border}██${blue}██${border}██
${border}██${redd}████${border}██${reset}    ${border}██${grayb}████████${haird}██${hair}██${grayb}██████${hair}██${grayb}██████${hair}██${grayb}████${hair}██${border}████${reset}      ${border}██${blue}██${border}██
${border}██${redd}██${border}██${reset}    ${border}██${hair}██${grayb}██████${hair}██${haird}████${hair}██${grayb}████${hair}████${grayb}████${haird}██${grayb}██████${hair}██${border}████${reset}  ${border}██${blue}████${border}██
${border}██${redd}██${border}██${reset}    ${border}██${haird}██${hair}██${grayb}██${hair}██${border}████${humand}██${haird}██${hair}██${grayb}██${haird}██${hair}██████${haird}██${hair}██${grayb}████${hair}██${border}██${blue}██${border}██${blue}██████${border}██
${border}██${redd}████${border}██${reset}  ${border}████${haird}██${hair}██${haird}██${whited}██${border}██${humand}████${haird}██${hair}██${border}████████${haird}████${hair}██${grayb}██${hair}██${border}██${blue}████████${border}██${reset}
  ${border}██${redd}██${border}██${reset}  ${border}██${reset}  ${border}██${hair}██${haird}██${whited}██${eyed}██${humanb}████${humand}██${haird}██${humand}██${border}████${whited}██${border}██${hair}██${haird}██${hair}████${border}██${blue}██████${border}██${reset}
  ${border}██${redd}██${border}██${reset}      ${border}██${haird}████${white}██${eyeb}██${humanb}██████${humand}██${humanb}██${eyed}██${white}██${humanb}██${haird}██${grayb}██${haird}████${hair}██${border}██${blue}████████${border}██${reset}
  ${border}██${redd}██${border}██${reset}  ${border}██${reset}  ${border}██${hair}██${haird}██${humanb}██${eyed}██${humanb}██████████${eyeb}██${eyed}██${humanb}██${grayb}████${haird}████${hair}██${border}██████████${reset}
    ${border}██${reset}  ${border}██${reset}  ${border}████${hair}██${haird}██${human}██${humanb}████████████${eyed}████${humanb}██${grayb}██${hair}██${haird}████${hair}██${border}████${blued}████${border}██${reset}
      ${border}██${redd}██${border}██${redd}██${border}████${hair}██${haird}██${human}██${humanb}██████████████${human}██${grayb}██${haird}██████${border}██${reset}    ${border}████${blued}██${border}██${reset}
      ${border}██${redd}██${border}████${redd}████${border}██${haird}████${human}████████████${humand}██${hair}██${haird}████████${border}██${reset}        ${border}██${blue}██${border}██
    ${border}██${redd}██${border}██${reset}    ${border}████${redd}██${border}████${reset}██${purpleb}██${humand}██████${purpleb}██${reset}██${border}██████${haird}██${border}██████${reset}  ${border}██${reset}  ${border}██${blue}██${border}██${reset}
    ${border}██${redd}██${border}██${reset}  ${border}██${reset}    ${border}██${clothb}██${border}██${clothd}██${reset}██${purpleb}██${eyed}██${purpleb}██${reset}██${border}██${clothb}██████${border}████${blued}████${border}██${blue}██${border}██${blue}██${border}██${reset}
      ${border}██${reset}  ${border}██${reset}  ${border}██${reset}  ${border}██${human}██${border}██${clothd}████${eyed}██${purpleb}██${eyed}██${clothd}████${clothb}██${human}████${border}██${blued}██${border}██████${blue}████${border}██${reset}
      ${border}██${reset}  ${border}████${redd}██${border}██${humanb}██${border}██${clothd}████${clothb}████${purpleb}██${clothd}██████${border}██${humanb}██${clothd}████${border}██${reset}    ${border}██${blue}██████${border}██${reset}
        ${border}████${redd}██${border}██${redd}██${border}██${clothd}████${clothb}████████${clothd}████████${border}██${clothd}██${humanb}██${border}██${reset}      ${border}██████${reset}
	${border}██${redd}██${border}██${reset}  ${border}██${clothd}████${clothb}██████████${redd}██${clothd}██${redd}██${clothd}██${redd}██${border}██████${reset}  ${border}██${reset}  ${border}██${blue}██${border}██${reset}
	${border}████${reset}    ${border}████${clothd}██${clothb}████████${redd}██${clothb}████${redd}██${clothd}██${redd}██${clothd}████${border}████${blue}██${border}██${blue}██${border}██${reset}
	${border}██${reset}          ${border}██${clothb}████████${redd}██${clothb}██${redd}██${clothb}██${redd}██${clothd}████${border}██${reset}  ${border}██${blue}████${border}██${reset}
	              ${border}██${eyed}██${border}██████████${clothd}████${border}████${reset}    ${border}██${blue}██████${border}██${reset}
		      ${border}████${reset}          ${border}██${eyed}██${border}██${reset}        ${border}██████${reset}
		                      ${border}██${reset}
EOF
