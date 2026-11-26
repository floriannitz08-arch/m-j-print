import {previewInvoice} from '../../../../lib/invoice-pdf';
export const runtime='nodejs';
export async function GET(){const bytes=await previewInvoice();return new Response(bytes,{headers:{'Content-Type':'application/pdf','Content-Disposition':'attachment; filename="mj-rechnungsvorschau.pdf"','Cache-Control':'no-store'}})}
