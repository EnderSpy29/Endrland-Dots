#!/bin/bash
pokemon[0]="pokemon-colorscripts --name umbreon --no-title"
pokemon[1]="pokemon-colorscripts --name zapdos --no-title"
pokemon[2]="pokemon-colorscripts --name darkrai --no-title"
pokemon[3]="pokemon-colorscripts --name yveltal --no-title"
pokemon[4]="pokemon-colorscripts --name garchomp --no-title"
pokemon[5]="pokemon-colorscripts --name rayquaza --shiny --no-title"
pokemon[6]="pokemon-colorscripts --name lapras --shiny --no-title"
pokemon[7]="pokemon-colorscripts --name haunter --no-title"
pokemon[8]="pokemon-colorscripts --name greninja --shiny --no-title"
pokemon[9]="pokemon-colorscripts --name gliscor --no-title"

rand=$[ $RANDOM % 9 ]
${pokemon[$rand]}
