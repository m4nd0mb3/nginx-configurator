install:
	sudo cp nginx-config.sh /bin/nginx-config
	sudo chmod +x /bin/nginx-config
	@echo "Script instalado com sucesso!"

uninstall:
	sudo rm -f /bin/nginx-config
	@echo "Script removido com sucesso!"

.PHONY: install uninstall
