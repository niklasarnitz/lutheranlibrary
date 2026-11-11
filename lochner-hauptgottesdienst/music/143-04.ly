\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 143, printed p. 118.
% At “lei”, staggered hollow heads preserve the source shapes in the four voices.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 180\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne b'2 a'2 \bar "|" g'1 \bar "|" a'4^\markup { \bold "Gem." }( b'4 a'2 \bar "|" g'2) g'2 \bar "|" g'1 \bar "||" }
      \new Voice { \voiceTwo g'2 fis'2 d'1 fis'4( g'2 fis'4 g'4) c'8[ d'8]( e'2*1/2 d'8[ c'8]) d'1 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t Die -- ner "dein," E \skip 1 \skip 1 \skip 1 lei "son!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne d'2 d'2 b1 d'2( c'2 d'4) e'8[ d'8]( c'2*1/2 b8[ a8]) b1 }
      \new Voice { \voiceTwo g,4 b,8[ c8] d4 d4 g1 d4 g,4 a,2 b,4 c2( g,4) g,1 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
