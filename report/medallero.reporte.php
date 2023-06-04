<?php

require_once '../vendor/autoload.php';
require_once '../model/Medallero.php';

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {

  //Instanciar clase superhero
    $medallero = new Medallero();
    $datos= $medallero->exportarMedalleros($_GET['iddisciplina'], $_GET['idolimpiada'], $_GET['estado']);
    $titulo = $_GET['titulo'];

    ob_start();

    //Archivos que componen PDF
    //Hoja de estilos
    include './estilos.html';
    //Archivos con satos (estaticos/dinamicos)
    include './medallero.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'es');
    $html2pdf->writeHTML($content);
    $html2pdf->output('Filtros.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}