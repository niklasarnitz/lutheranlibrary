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
      \new Voice = "soprano" { \voiceOne fis'4 fis'4 g'4 g'4 \bar "|" fis'2 d'2 \bar "|" a'4 b'4 a'4 g'4 \bar "|" a'2 fis'2 \bar "|" g'2.( e'4) \bar "|" fis'1 \bar "|" e'2 fis'4 fis'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo d'4 d'4 d'4 d'4 d'2 a2 fis'4 g'4 fis'4 e'4 e'2 d'2 d'2.( cis'4) d'1 cis'2 d'4 d'4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t bo -- "ren," nicht ge -- schaf -- "fen," Ei -- nes We -- sens mit dem Va \skip 1 "ter," durch wel -- chen }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a4 a4 b4 b4 a2 fis2 d'4 d'4 d'4 b4 a2 a2 b2.( a4) a1 a2 a4 b4 }
      \new Voice = "bass" { \voiceTwo d4 d4 g,4 g,4 d2 d2 d4 g4 d4 e4 cis2 d2 g,2.( a,4) d1 a,2 d4 b,4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
