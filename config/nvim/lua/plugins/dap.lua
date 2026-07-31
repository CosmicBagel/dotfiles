return {
	{
		"mfussenegger/nvim-dap",
		opts = function()
			local dap = require("dap")
			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Listen for Xdebug (moodle)",
					port = 9003,
					pathMappings = {
						["/var/www/moodle"] = "${workspaceFolder}",
					},
				},
			}
		end,
	},
}
