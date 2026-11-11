\version "2.24.3"
% Lochner, V. Sanctus. Source pages 223–224.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \once \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''4 c''4 bes'8[ a'8] g'4 \bar "|" a'2 r2 \bar "|" g'4 g'4 g'4 g'8 g'8 \bar "|" g'2 g'4 c''8 e''8 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'4 f'4 g'8[ f'8] e'4 f'2 s2 e'4 e'4 d'4 d'8 d'8 e'2 d'4 e'8 g'8 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t HEr -- re Ze -- ba \skip 1 "oth!" Voll sind Him -- mel und Erd -- reich dei -- ner }
    \new Staff <<
      \clef bass \once \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'4 c'4 d'8[ c'8] c'4 c'2 r2 c'4 c'4 d'4 b!8 \once \omit Accidental b8 c'2 d'4 c'8 c'8 }
      \new Voice = "bass" { \voiceTwo a,4 a,4 bes,8[ f8] c4 f,2 s2 c4 c4 b,!4 g,8 g,8 c2 b,!4 a,8 e,8 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
