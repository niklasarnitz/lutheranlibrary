\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
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
      \new Voice = "soprano" { \voiceOne fis'2 d'2 \bar "|" fis'2( gis'2) \bar "|" a'2 a'2 \bar "|" b'2. b'4 \bar "|" a'2 d'2 \bar "|" e'1 \bar "|" d'1 \bar "|" d''2( cis''4) cis''4 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 a2 d'2( e'2) e'2 e'2 fis'2. e'4 cis'2 d'2( d'2) cis'2 a1 fis'2( e'4) e'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t aus dem Va \skip 1 ter vor al -- ler Zeit ge -- bo -- "ren," Gott \skip 1 von }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 fis2 b1 cis'2 a2 fis2. gis4 a2 fis2 a1 fis1 a2. a4 }
      \new Voice = "bass" { \voiceTwo d2 d2 b,2( e2) a,2 cis2 d2. e4 fis2 b,2 a,1 d1 d2( a,4) a,4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
