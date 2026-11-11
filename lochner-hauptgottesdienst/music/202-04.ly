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
      \new Voice = "soprano" { \voiceOne fis'2 gis'2 \bar "|" a'2 b'4 b'4 \bar "|" a'2 a'4 d'4 \bar "|" e'2. e'4 \bar "|" d'1\fermata \bar "||" fis'2( a'2) \bar "|" fis'4 fis'4 d'4 d'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 e'2 e'2 fis'4 e'4 cis'2 d'4 d'4 d'2. cis'4 a1 d'2( e'2) d'4 d'4 b4 b4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t al -- ler sicht -- ba -- ren und un -- sicht -- ba -- ren "Ding." Ich \skip 1 glau -- be an den }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne b2 b2 a2 fis4 gis4 a2 fis4 fis4 a2. a4 fis1 a1 a4 a4 g4 g4 }
      \new Voice = "bass" { \voiceTwo b,2 e2 cis2 d4 e4 fis2 d4 b,4 a,2. a,4 d1\fermata d2( cis2) d4 d4 g,4 g,4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
