<?php
Class Concatenate {
	private $assetsPath =  '../../www/assets/';
	private $dataPath = '../../src/';

	public function __construct($type, $outputName, $sourcePath = null, $outputPath = null, $jsonFile = null) {
		$this->outputName = $outputName;
		$this->type = $type;
		$this->path = $outputPath ? $outputPath : $this->assetsPath . $type . '/';
		$this->sourcePath = $sourcePath ? $sourcePath : $this->dataPath . $type . '/';
		$this->jsonFile = $jsonFile ? $jsonFile : 'files_manifest.json';

		$this->jsonData = $this->_loadJson();
		$this->files = $this->jsonData->$type;

		$this->_call();
	}

	private function _call() {
		$result = '';
		$result .= '/* '. date("Y/m/d H:i:s") . "*/\n\n";

		for ($i = 0; $i < count($this->files); $i++) {
			$partialContent = '';
			$partialContent .= '/* ' . $this->files[$i] . '*/';
			$partialContent .= "\n";
			$partialContent .= file_get_contents($this->sourcePath . $this->files[$i]);
			$partialContent .= "\n\n";

			$result .= $partialContent;
		}

		echo $result;

		// if is localhost update js file
		if (preg_match('/(localhost|192\.168)/', $_SERVER['HTTP_HOST'], $matches)) {
			$this->_writeToFile($result);
		}
	}

	private function _loadJson() {
		$json = file_get_contents($this->dataPath . $this->jsonFile);

		return json_decode($json);
	}

	private function _writeToFile($result) {
		$file = $this->path . $this->outputName . '.' . $this->type;

		if (file_exists($file)) {
			unlink($file);
		}

		file_put_contents($file, $result);
	}
}
