class flechaInimiga extends flecha {

	public function flechaInimiga () {
		alvo = _root.jogador1_mc;
		xdestino = _root.jogador1_mc._x;
		ydestino = _root.jogador1_mc._y;
		
		calculos();
		
		this._rotation = grau;
	}
	
	public function implodir () {
		this.removeMovieClip();
		_root.numeroFlechasInimigasNoPalco--;
	}
}