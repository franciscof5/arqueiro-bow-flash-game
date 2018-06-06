class flechaAmiga extends flecha {
	public function flechaAmiga () {
		xdestino = _root._xmouse;
		ydestino = _root._ymouse;
		
		calculos();
		
		this._rotation = grau;
	}
	
	public function implodir () {
		this.removeMovieClip();
		_root.numeroFlechasAmigasNoPalco--;
	}
}