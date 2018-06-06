package   
{  
                import flash.display.MovieClip;  
public class bang extends XMLSocket{
	
	public function conectar(){
		this.connect("novometodo.com.br", 9999);
	}
	public function conversar(alvo,msg){
		var xml='<ign acao="conversar" alvoID="'+alvo+'">'+msg+'</ign>';
		this.send(xml);
	}
	public function desistir(){
		var msg='<ign acao="desistir"/>';
		this.send(msg);
	}
	public function perder(ID){
		var msg='<ign acao="perder" alvoID="'+ID+'"/>';
		this.send(msg);
	}
	public function logar(nome){
		var msg='<ign acao="logar" nome="'+nome+'"/>';
		this.send(msg);
	}
	
	public function desafiar(alvo){
		var msg='<ign acao="desafiar" alvoID="'+alvo+'"/>';
		this.send(msg);
	}
	
	public function aceitarDesafio (){
		var msg='<ign acao="aceitarDesafio"/>';
		this.send(msg);
	}
	
	public function recusarDesafio (){
		var msg='<ign acao="recusarDesafio"/>';
		this.send(msg);
	}
	
	public function listarUsuarios(){
		var msg='<ign acao="listarUsuarios"/>';
		this.send(msg);
	}
	
	public function jogar(x,y,grau,tiro_,bool){
		var msg='<ign acao="jogar"><jogar x="'+x+'" y="'+y+'" grau="'+grau+'" tiro_="'+tiro_+'" bool="'+bool+'"/></ign>';
		this.send(msg);
	}
	public function atingido(bool) {
		var msg='<ign acao="jogar"><jogar atingido="true" bool="'+bool+'"/></ign>';
		this.send(msg);
	}
}
}