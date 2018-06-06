class eventHandler{
	public function eventHandler(sock,caller){
		sock.onConnect = function(success) {
			if (success) {
				caller.adicionaTexto("<b>Server connection established!</b>");
				sock.logar(caller.nome_txt.text);
			} else {
				caller.adicionaTexto("<b>Server connection failed!</b>");
			}
		};
		sock.onClose = function() {
			caller.adicionaTexto("<b>Server connection lost</b>");
		};
		sock.onData = function(msg) {
			msg=msg.substr(0,msg.indexOf('<ignorar'));
			var docXML:XML=new XML(msg);
			var respXML=docXML.firstChild;
			for(var i=0;i<respXML.childNodes.length;i++){
				if(respXML.childNodes[i].nodeName=='msg'){
					caller.adicionaTexto(respXML.childNodes[i].toString());
				}else if(respXML.childNodes[i].nodeName=='logados'){
					caller.atualizaLogados(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='desafio'){
					caller.desafio(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='desistir'){
					caller.desistir(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='jogar'){
					caller.jogar(respXML.childNodes[i]);
				}
			}
		};
	}
}