/**
 * This file is part of zdiscord.
 * Copyright (C) 2021 Tony/zfbx
 * source: <https://github.com/zfbx/zdiscord>
 *
 * This work is licensed under the Creative Commons
 * Attribution-NonCommercial-ShareAlike 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
 * or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
 */

 const { MessageButton } = require("discord.js");

 module.exports = {
    name: "addcredits",
    description: "Add F9 Credits",
    role: "god",
    
    options: [
        {
            name: "citizenid",
            description: "Citizen ID",
            required: true,
            type: "STRING",
        },
        {
            name: "amount",
            description: "Amount to add",
            required: true,
            type: "INTEGER",
        }
    ],

    run: async (client, interaction, args) => {

        global.exports.oxmysql.update_async("UPDATE ak4y_donatesystem SET credit = credit + ? WHERE citizenid = ?", [
            args.amount,
            args.citizenid,
        ]);

        return interaction.reply({ content: `Added F9 Credit Balance: ${args.amount} for ${args.citizenid}`, ephemeral: false });
    },
};