\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed pages 182–183.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne a'4 b'4 a'4 g'4 \bar "|" a'2 fis'4 fis'4 \bar "|" a'2 a'2 \bar "|" d''2 cis''4 cis''4 \bar "|" b'1 \bar "|" a'1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo d'4 d'4 cis'4 d'4 e'2 d'4 d'4 e'2 fis'2 fis'4( gis'4) a'4 a'4( a'4) gis'8[ fis'8(] g'2) e'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t li -- "ge," all -- ge -- mei -- ne und a -- po -- sto -- li -- sche Kir -- "che." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a4 g4 e4 b4 a2 a4 b4 cis'2 cis'2 d'2 e'4 e'4 e'2( b2) cis'1 }
      \new Voice = "bass" { \voiceTwo fis,4 g,4 a,4 b,4 cis2 d4 b,4 a,2 fis,2 b,2 cis4 a,4 cis1 a,1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
