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
      \new Voice = "soprano" { \voiceOne b'2 a'2 \bar "|" fis'4 g'4 e'2 \bar "|" d'1\fermata \bar "||" a'4 a'4 b'4 cis''4 \bar "|" d''2 d''2 \bar "|" b'2 b'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 d'2 d'4 d'2 cis'4 d'1 fis'4 fis'4 g'4 g'4 fis'2 fis'2 e'2 e'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Him -- mels und der Er "den." Und an JE -- sum Chri -- "stum," sei -- nen }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne g2 fis2 a4 b4 a2 fis1 d'4 d'4 d'4 e'4 a2 a2 a2 gis2 }
      \new Voice = "bass" { \voiceTwo g2 d2 d4 g,4 a,2 d1\fermata d4 d4 g4 e4 d2 d2 e2 e2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
