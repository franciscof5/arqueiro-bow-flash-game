class bang extends XMLSocket{
	public function conversar(alvo,msg){
		var xml='<ignorar alvo="'+alvo+'" acao="conversar">'+msg+'</ignorar>';
		this.enviar(xml);
	}
	
	private function enviar(xml){
		this.send(xml);
	}
	public function conectar(){
		this.connect("novometodo.com.br", 9999);
	}
	public function desistir(){
		var msg='<ignorar acao="desistir"/>';
		this.enviar(msg);
	}
	
	public function logar(nome){
		var msg='<ignorar acao="conectar" alvo="" nome="'+nome+'"/>';
		this.send(msg);
	}
	
	public function desafiar(alvo){
		var msg='<ignorar acao="desafiar" alvo="'+alvo+'"/>';
		this.send(msg);
	}
	
	public function listarUsuarios(){
		var msg='<ignorar acao="listarUsuarios"/>';
		this.send(msg);
	}
	
	public function jogar(x,y,grau,tiro_,bool){
		var msg='<ignorar alvo="'+_root.alvoID+'" acao="jogar" x="'+x+'" y="'+y+'" grau="'+grau+'" tiro_="'+tiro_+'" bool="'+bool+'"/>';
		this.send(msg);
	}
}