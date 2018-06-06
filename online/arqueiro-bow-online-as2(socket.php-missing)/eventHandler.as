class eventHandler{
	public function eventHandler(sock, caller, nome) {
		sock.onConnect = function(success) {
			if (success) {
				caller.conversar("<b>Server connection established!</b>");
				sock.logar(nome);
			} else {
				caller.conversar("<b>Server connection failed!</b>");
			}
		};
		sock.onClose = function() {
			caller.conversar("<b>Server connection lost</b>");
		};
		sock.onData = function(msg) {
			msg=msg.substr(0,msg.indexOf('<ign'));
			var docXML:XML=new XML(msg);
			var respXML=docXML.firstChild;
			for(var i=0;i<respXML.childNodes.length;i++){
				if(respXML.childNodes[i].nodeName=='conversar'){
					caller.conversar(respXML.childNodes[i].toString());
				}else if(respXML.childNodes[i].nodeName=='logar'){
					caller.logar(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='usuarios'){
					caller.usuarios(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='desafiar'){
					caller.desafiar(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='aceitarDesafio'){
					caller.aceitarDesafio(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='recusarDesafio'){
					caller.recusarDesafio(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='desistir'){
					caller.desistir(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='jogar'){
					caller.jogar(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='perder'){
					caller.perder(respXML.childNodes[i]);
				}else if(respXML.childNodes[i].nodeName=='ganhar'){
					caller.ganhar(respXML.childNodes[i]);
				}else{
					trace('else:'+respXML.childNodes[i].toString());
				}
			}
		};
	}
}